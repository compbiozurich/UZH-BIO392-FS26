#!/bin/bash
# =============================================================================
# Human Population Structure Analysis Pipeline
# Input : bgzipped VCF (.vcf.gz) + tabix index (.tbi) — chromosome 1
#         1000 Genomes Project GRCh38
# Tools : PLINK2, ADMIXTURE, R (ggplot2, tidyverse, RColorBrewer)
# Workflow: .vcf.gz + .tbi → PLINK QC → LD Pruning → PCA → ADMIXTURE → Plots
# Environment: WSL (Windows Subsystem for Linux)
# =============================================================================
# USAGE:
#   bash population_structure_pipeline.sh
#
# FIRST TIME SETUP — install dependencies by running:
#   bash population_structure_pipeline.sh --install
# =============================================================================

set -euo pipefail  # Exit on error, undefined vars, pipe failures

# =============================================================================
# 0. CONFIGURATION — Edit these variables
# =============================================================================

# ── Path to your VCF file and index ─────────────────────────────────────────
# Both files must be in the same folder. WSL accesses your Windows OneDrive
# folder directly via /mnt/c/... — no copying needed.

INPUT_VCF="/mnt/c/Users/belin/OneDrive/Uni/FS26/Bio392/notebook/ALL.chr1.shapeit2_integrated_v1a.GRCh38.20181129.phased (1).vcf.gz"
INDEX_FILE="${INPUT_VCF}.tbi"           # Expected: same path + .tbi

OUT_PREFIX="pop_structure_chr1"         # Prefix for all output files
OUTDIR="/mnt/c/Users/belin/OneDrive/Uni/FS26/Bio392/notebook/results"  # Output in your working directory

# ── LD Pruning parameters ─────────────────────────────────────────────────────
WINDOW_SIZE=50                          # Window size in kb
STEP_SIZE=10                            # Step size (SNPs)
R2_THRESHOLD=0.1                        # r² cutoff

# ── ADMIXTURE parameters ──────────────────────────────────────────────────────
K_MIN=2                                 # Minimum K to test
K_MAX=10                                # Maximum K to test
CV_FOLDS=10                             # Cross-validation folds

# ── Performance ───────────────────────────────────────────────────────────────
# For WSL on a laptop, use total_cores - 1 to keep the system responsive.
# Check your core count with: nproc
THREADS=4                               # Adjust to your machine (nproc to check)

# ── PLINK QC filters (human defaults) ────────────────────────────────────────
MAF=0.05                                # Minor allele frequency cutoff
GENO=0.1                                # Max per-SNP missingness
MIND=0.1                                # Max per-sample missingness
HWE=1e-6                                # Hardy-Weinberg equilibrium p-value cutoff

# =============================================================================
# 0b. INSTALL MODE  (run with: bash pipeline.sh --install)
# =============================================================================

install_dependencies() {
    echo "========================================"
    echo " Installing dependencies via Conda"
    echo " (most reliable method for WSL/Linux)"
    echo "========================================"

    # ── Step 1: Install Miniforge (conda) if not already present ─────────────
    if command -v conda &>/dev/null; then
        echo "[1/3] conda already installed: $(conda --version)"
    else
        echo "[1/3] Installing Miniforge (conda)..."
        wget --show-progress -O /tmp/miniforge.sh \
            "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh"
        bash /tmp/miniforge.sh -b -p "$HOME/miniforge3"
        # Initialise conda in this shell session immediately
        source "$HOME/miniforge3/etc/profile.d/conda.sh"
        conda init bash
        echo "  Miniforge installed at ~/miniforge3 ✓"
    fi

    # Make sure conda is active in this shell
    if [[ -f "$HOME/miniforge3/etc/profile.d/conda.sh" ]]; then
        source "$HOME/miniforge3/etc/profile.d/conda.sh"
    fi

    # ── Step 2: Install plink2 + admixture via bioconda ──────────────────────
    echo ""
    echo "[2/3] Installing plink2 and admixture via bioconda..."
    conda install -y -c bioconda -c conda-forge plink2 admixture
    echo "  plink2   : $(plink2 --version 2>&1 | head -1)"
    echo "  admixture: $(admixture 2>&1 | head -1 || echo 'installed')"

    # ── Step 3: Install R packages ────────────────────────────────────────────
    echo ""
    echo "[3/3] Installing R packages (ggplot2, tidyverse, RColorBrewer)..."
    Rscript -e "
        pkgs <- c('ggplot2', 'tidyverse', 'RColorBrewer')
        missing <- pkgs[!pkgs %in% installed.packages()[,'Package']]
        if (length(missing) > 0) {
            install.packages(missing, repos='https://cloud.r-project.org', quiet=TRUE)
            cat('Installed:', paste(missing, collapse=', '), '\n')
        } else {
            cat('All R packages already installed.\n')
        }
    "

    echo ""
    echo "========================================"
    echo " Installation complete! Continuing to run pipeline..."
    echo "========================================"
    echo ""
}

# Trigger install mode if --install flag passed
if [[ "${1:-}" == "--install" ]]; then
    install_dependencies
fi

# =============================================================================
# 0c. DEPENDENCY CHECKS
# =============================================================================
# Activate conda environment if available so tools installed via --install are found
if [[ -f "$HOME/miniforge3/etc/profile.d/conda.sh" ]]; then
    source "$HOME/miniforge3/etc/profile.d/conda.sh"
elif [[ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]]; then
    source "$HOME/anaconda3/etc/profile.d/conda.sh"
elif [[ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]]; then
    source "$HOME/miniconda3/etc/profile.d/conda.sh"
fi

echo "--- Checking required tools ---"

MISSING_TOOLS=()
for tool in plink2 admixture Rscript; do
    if command -v "${tool}" &>/dev/null; then
        echo "  ✓ ${tool} ($(command -v ${tool}))"
    else
        echo "  ✗ MISSING: ${tool}"
        MISSING_TOOLS+=("${tool}")
    fi
done

if [[ ${#MISSING_TOOLS[@]} -gt 0 ]]; then
    echo ""
    echo "ERROR: Missing tools: ${MISSING_TOOLS[*]}"
    echo "  Run the following to install everything automatically:"
    echo ""
    echo "    bash $(basename "$0") --install"
    echo ""
    exit 1
fi

echo "--- All tools found. Proceeding. ---"
echo ""

# =============================================================================
# 1. SETUP
# =============================================================================

mkdir -p "${OUTDIR}/01_plink"
mkdir -p "${OUTDIR}/02_ld_pruning"
mkdir -p "${OUTDIR}/03_pca"
mkdir -p "${OUTDIR}/04_admixture"
mkdir -p "${OUTDIR}/05_plots"

LOG="${OUTDIR}/pipeline.log"
exec > >(tee -a "${LOG}") 2>&1

echo "============================================"
echo " Population Structure Pipeline Started"
echo " $(date)"
echo "============================================"
echo "Input VCF  : ${INPUT_VCF}"
echo "Output dir : ${OUTDIR}"
echo ""

# =============================================================================
# 2. VALIDATE INPUT FILES
# =============================================================================
# PLINK2 reads .vcf.gz natively when a .tbi index is present alongside it.
# This is the fastest possible input — no decompression needed at all.

echo "[STEP 0] Validating input files..."

# ── Check .vcf.gz exists ─────────────────────────────────────────────────────
if [[ ! -f "${INPUT_VCF}" ]]; then
    echo "ERROR: VCF file not found: ${INPUT_VCF}"
    echo ""
    echo "  Check the file is in: /mnt/c/Users/belin/OneDrive/Uni/FS26/Bio392/notebook/"
    echo "  List files there with: ls \"/mnt/c/Users/belin/OneDrive/Uni/FS26/Bio392/notebook/\""
    exit 1
fi
echo "  VCF file  : $(du -h "${INPUT_VCF}" | cut -f1) — ${INPUT_VCF} ✓"

# ── Check .tbi index exists ───────────────────────────────────────────────────
if [[ ! -f "${INDEX_FILE}" ]]; then
    echo "ERROR: Tabix index not found: ${INDEX_FILE}"
    echo ""
    echo "  The index file must be in the same folder as the VCF and named:"
    echo "  ALL.chr1.shapeit2_integrated_v1a.GRCh38.20181129.phased (1).vcf.gz.tbi"
    echo ""
    echo "  If you have a .tbi file with a slightly different name, rename it to match exactly."
    exit 1
fi
echo "  Index file: ${INDEX_FILE} ✓"

# ── Quick sanity check — confirm bgzip format ────────────────────────────────
if command -v bgzip &>/dev/null; then
    if bgzip -t "${INPUT_VCF}" 2>/dev/null; then
        echo "  bgzip integrity: PASSED ✓"
    else
        echo "  WARNING: bgzip check failed — file may be corrupted. Proceeding anyway."
    fi
fi

echo ""
echo "[STEP 0] Files validated. PLINK2 will read directly from the bgzipped VCF."
echo "         (No decompression needed — this is the fastest possible input format)"
echo ""

# =============================================================================
# 3. VCF → PLINK FORMAT CONVERSION + QUALITY FILTERING
# =============================================================================

echo "[STEP 1] Converting VCF to PLINK binary format + QC filtering..."

plink2 \
    --vcf "${INPUT_VCF}" \
    --make-bed \
    --out "${OUTDIR}/01_plink/${OUT_PREFIX}_raw" \
    --maf ${MAF} \
    --geno ${GENO} \
    --mind ${MIND} \
    --hwe ${HWE} \
    --allow-extra-chr \
    --autosome \
    --chr-set 22 \
    --snps-only \
    --threads ${THREADS}

# NOTE: --autosome keeps only autosomes (chr 1-22), recommended for population structure.
# Remove --autosome if you want to include chrX.
# --snps-only drops indels and keeps biallelic SNPs only.

echo "[STEP 1] Done. SNP count after QC:"
wc -l "${OUTDIR}/01_plink/${OUT_PREFIX}_raw.bim" | awk '{print $1, "SNPs retained"}'

# =============================================================================
# 4. LD PRUNING
# =============================================================================

echo ""
echo "[STEP 2] LD Pruning (window=${WINDOW_SIZE}kb, step=${STEP_SIZE}, r2<${R2_THRESHOLD})..."

# Step 2a: Generate list of SNPs to keep after LD pruning
plink2 \
    --bfile "${OUTDIR}/01_plink/${OUT_PREFIX}_raw" \
    --set-all-var-ids @:# \
    --indep-pairwise ${WINDOW_SIZE} ${STEP_SIZE} ${R2_THRESHOLD} \
    --out "${OUTDIR}/02_ld_pruning/${OUT_PREFIX}_ld" \
    --threads ${THREADS}

# Step 2b: Extract pruned SNP set
plink2 \
    --bfile "${OUTDIR}/01_plink/${OUT_PREFIX}_raw" \
    --set-all-var-ids @:# \
    --extract "${OUTDIR}/02_ld_pruning/${OUT_PREFIX}_ld.prune.in" \
    --make-bed \
    --out "${OUTDIR}/02_ld_pruning/${OUT_PREFIX}_pruned" \
    --threads ${THREADS}

echo "[STEP 2] Done. SNP count after LD pruning:"
wc -l "${OUTDIR}/02_ld_pruning/${OUT_PREFIX}_pruned.bim" | awk '{print $1, "SNPs retained"}'

# =============================================================================
# 5. PCA ANALYSIS
# =============================================================================

echo ""
echo "[STEP 3] Running PCA (PLINK2 fast PCA)..."

plink2 \
    --bfile "${OUTDIR}/02_ld_pruning/${OUT_PREFIX}_pruned" \
    --pca 20 \
    --out "${OUTDIR}/03_pca/${OUT_PREFIX}_pca" \
    --threads ${THREADS}

# Output files:
#   .eigenvec  — eigenvectors (PC scores per sample)
#   .eigenval  — eigenvalues (variance explained per PC)

echo "[STEP 3] PCA complete."
echo "  Eigenvectors: ${OUTDIR}/03_pca/${OUT_PREFIX}_pca.eigenvec"
echo "  Eigenvalues : ${OUTDIR}/03_pca/${OUT_PREFIX}_pca.eigenval"

# =============================================================================
# 6. ADMIXTURE ANALYSIS (K = K_MIN to K_MAX with cross-validation)
# =============================================================================

echo ""
echo "[STEP 4] Running ADMIXTURE for K=${K_MIN} to K=${K_MAX}..."

# ADMIXTURE requires .bed input and must be run from the directory containing it
ADMIX_DIR="${OUTDIR}/04_admixture"
PRUNED_BED="${OUTDIR}/02_ld_pruning/${OUT_PREFIX}_pruned.bed"

# Copy pruned PLINK files into admixture dir (ADMIXTURE writes output to CWD)
cp "${OUTDIR}/02_ld_pruning/${OUT_PREFIX}_pruned.bed" "${ADMIX_DIR}/"
cp "${OUTDIR}/02_ld_pruning/${OUT_PREFIX}_pruned.bim" "${ADMIX_DIR}/"
cp "${OUTDIR}/02_ld_pruning/${OUT_PREFIX}_pruned.fam" "${ADMIX_DIR}/"

cd "${ADMIX_DIR}"

CV_LOG="${OUT_PREFIX}_cv_errors.txt"
echo "K CV_error" > "${CV_LOG}"

for K in $(seq ${K_MIN} ${K_MAX}); do
    echo "  Running ADMIXTURE K=${K}..."
    admixture \
        --cv=${CV_FOLDS} \
        -j${THREADS} \
        "${OUT_PREFIX}_pruned.bed" ${K} \
        > "admixture_K${K}.log" 2>&1

    # Extract CV error from log
    CV_ERR=$(grep "CV error" "admixture_K${K}.log" | awk '{print $4}')
    echo "${K} ${CV_ERR}" >> "${CV_LOG}"
    echo "    K=${K} CV error = ${CV_ERR}"
done

cd - > /dev/null

echo "[STEP 4] ADMIXTURE complete. CV errors saved to ${ADMIX_DIR}/${CV_LOG}"

# =============================================================================
# 7. GENERATE PLOTS WITH R
# =============================================================================

echo ""
echo "[STEP 5] Generating plots with R..."

Rscript - <<EOF
suppressPackageStartupMessages({
  library(ggplot2)
  library(tidyverse)
  library(RColorBrewer)
})

outdir    <- "${OUTDIR}"
prefix    <- "${OUT_PREFIX}"
plot_dir  <- file.path(outdir, "05_plots")

# ── PCA Plot ────────────────────────────────────────────────────────────────

eigenvec_file <- file.path(outdir, "03_pca", paste0(prefix, "_pca.eigenvec"))
eigenval_file <- file.path(outdir, "03_pca", paste0(prefix, "_pca.eigenval"))

pca <- read.table(eigenvec_file, header = TRUE)
colnames(pca)[1:2] <- c("FID", "IID")
pc_cols <- grep("^PC", colnames(pca), value = TRUE)

eigenval <- scan(eigenval_file, quiet = TRUE)
pct_var  <- round(eigenval / sum(eigenval) * 100, 2)

# PC1 vs PC2 — colour by FID (family/population ID from .fam file)
p_pca <- ggplot(pca, aes(x = PC1, y = PC2, color = FID)) +
  geom_point(alpha = 0.8, size = 2) +
  labs(
    title = "PCA of Human Population Structure",
    x = paste0("PC1 (", pct_var[1], "% variance)"),
    y = paste0("PC2 (", pct_var[2], "% variance)"),
    color = "Population"
  ) +
  theme_classic(base_size = 13) +
  theme(legend.position = "right")

ggsave(file.path(plot_dir, "PCA_PC1_PC2.pdf"), p_pca, width = 8, height = 6)
ggsave(file.path(plot_dir, "PCA_PC1_PC2.png"), p_pca, width = 8, height = 6, dpi = 300)

# Scree plot
scree_df <- data.frame(PC = 1:length(pct_var), Variance = pct_var)
p_scree <- ggplot(scree_df[1:10, ], aes(x = PC, y = Variance)) +
  geom_col(fill = "#4E79A7") +
  geom_line(group = 1, color = "black") +
  geom_point() +
  labs(title = "Scree Plot", x = "Principal Component", y = "% Variance Explained") +
  scale_x_continuous(breaks = 1:10) +
  theme_classic(base_size = 13)

ggsave(file.path(plot_dir, "PCA_scree.pdf"), p_scree, width = 7, height = 5)

cat("  PCA plots saved.\n")

# ── CV Error Plot ────────────────────────────────────────────────────────────

cv_file <- file.path(outdir, "04_admixture", paste0(prefix, "_cv_errors.txt"))
cv <- read.table(cv_file, header = TRUE)

p_cv <- ggplot(cv, aes(x = K, y = CV_error)) +
  geom_line(color = "#E15759") +
  geom_point(size = 3, color = "#E15759") +
  scale_x_continuous(breaks = cv\$K) +
  labs(title = "ADMIXTURE Cross-Validation Error", x = "K (number of ancestral populations)", y = "CV Error") +
  theme_classic(base_size = 13)

ggsave(file.path(plot_dir, "ADMIXTURE_CV_error.pdf"), p_cv, width = 7, height = 5)
ggsave(file.path(plot_dir, "ADMIXTURE_CV_error.png"), p_cv, width = 7, height = 5, dpi = 300)

cat("  CV error plot saved.\n")

# ── ADMIXTURE Bar Plots (for each K) ─────────────────────────────────────────

admix_dir <- file.path(outdir, "04_admixture")
fam_file  <- file.path(admix_dir, paste0(prefix, "_pruned.fam"))
fam       <- read.table(fam_file, header = FALSE)[, 1:2]
colnames(fam) <- c("FID", "IID")

k_values <- cv\$K

for (k in k_values) {
  q_file <- file.path(admix_dir, paste0(prefix, "_pruned.", k, ".Q"))
  if (!file.exists(q_file)) next

  q_mat <- read.table(q_file)
  colnames(q_mat) <- paste0("K", 1:k)
  q_df <- cbind(fam, q_mat) %>%
    arrange(FID) %>%
    mutate(Sample = row_number()) %>%
    pivot_longer(cols = starts_with("K"), names_to = "Ancestry", values_to = "Proportion")

  colors <- colorRampPalette(brewer.pal(min(k, 11), "Set3"))(k)

  p_admix <- ggplot(q_df, aes(x = Sample, y = Proportion, fill = Ancestry)) +
    geom_col(width = 1) +
    scale_fill_manual(values = colors) +
    facet_grid(~ FID, scales = "free_x", space = "free") +
    labs(title = paste0("ADMIXTURE K=", k), x = "Samples", y = "Ancestry Proportion") +
    theme_classic(base_size = 11) +
    theme(
      axis.text.x  = element_blank(),
      axis.ticks.x = element_blank(),
      strip.text   = element_text(size = 8, angle = 90),
      legend.position = "right"
    )

  ggsave(file.path(plot_dir, paste0("ADMIXTURE_K", k, ".pdf")), p_admix, width = 12, height = 4)
  ggsave(file.path(plot_dir, paste0("ADMIXTURE_K", k, ".png")), p_admix, width = 12, height = 4, dpi = 300)
  cat(paste0("  ADMIXTURE K=", k, " plot saved.\n"))
}

cat("\nAll plots saved to:", plot_dir, "\n")
EOF

# =============================================================================
# 8. SUMMARY
# =============================================================================

echo ""
echo "============================================"
echo " Pipeline Complete! $(date)"
echo "============================================"
echo ""
echo "Output structure:"
echo "  ${OUTDIR}/"
echo "  ├── pipeline.log              ← Full run log"
echo "  ├── 01_plink/                 ← QC-filtered PLINK binary files"
echo "  ├── 02_ld_pruning/            ← LD-pruned PLINK files"
echo "  ├── 03_pca/                   ← PCA eigenvectors + eigenvalues"
echo "  ├── 04_admixture/             ← .Q files, .P files, CV error log"
echo "  └── 05_plots/                 ← All PDF + PNG plots"
echo ""
echo "Key outputs:"
echo "  PCA plot     : ${OUTDIR}/05_plots/PCA_PC1_PC2.pdf"
echo "  Scree plot   : ${OUTDIR}/05_plots/PCA_scree.pdf"
echo "  CV error     : ${OUTDIR}/05_plots/ADMIXTURE_CV_error.pdf"
echo "  ADMIXTURE    : ${OUTDIR}/05_plots/ADMIXTURE_K*.pdf"
echo ""
echo "Next steps:"
echo "  1. Choose best K from CV error plot (lowest CV error = best K)"
echo "  2. Add population labels to .fam FID column for better plot colouring"
echo "  3. Run PC3 vs PC4, PC5 vs PC6 plots as needed"
