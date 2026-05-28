#!/usr/bin/env bash
###############################################################################
# UZH BIO392 - Exercise 1
# Population structure on chromosome 1 - optimised for 16 vCPUs / 64 GB RAM
# Pipeline: download -> bcftools pre-filter -> PLINK -> QC -> LD prune
#           -> PCA -> ADMIXTURE
###############################################################################

export PATH="$HOME/bin:$PATH"
set -euo pipefail

# -------- 0. Resources & paths ----------------------------------------------
THREADS=16
MEMORY_MB=50000

# 4 jobs x 4 threads = 16 cores; ADMIXTURE thread scaling plateaus past ~4
ADMIX_PARALLEL=4
ADMIX_THREADS=4

WORKDIR="$(pwd)/popstruct_chr1"
mkdir -p "${WORKDIR}"/{raw,filtered,plink,pruned,pca,admixture,logs,meta}
cd "${WORKDIR}"

VCF_BASE_PRIMARY="https://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/1000_genomes_project/release/20181203_biallelic_SNV"
VCF_BASE_FALLBACK="https://ftp-trace.ncbi.nlm.nih.gov/1000genomes/ftp/data_collections/1000_genomes_project/release/20181203_biallelic_SNV"
VCF_FILE="ALL.chr1.shapeit2_integrated_v1a.GRCh38.20181129.phased.vcf.gz"
VCF_PATH="raw/${VCF_FILE}"

PANEL_URL="https://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/integrated_call_samples_v3.20130502.ALL.panel"
PANEL_FILE="meta/samples.panel"

PREFIX="chr1_1kg"

# -------- 1. Download --------
echo "[1/8] Downloading chr1 VCF and panel..."

# Install aria2 if missing (ignore failure; we have wget as fallback)
if ! command -v aria2c >/dev/null 2>&1; then
    echo "  [info] installing aria2 for parallel download"
    apt-get install -y --no-install-recommends aria2 >/dev/null 2>&1 \
        || sudo apt-get install -y --no-install-recommends aria2 >/dev/null 2>&1 \
        || echo "  [warn] could not install aria2, falling back to wget"
fi

remote_size() {
    curl -sIL "$1" | awk 'BEGIN{IGNORECASE=1} /^content-length:/ {print $2}' \
        | tr -d '\r' | tail -n1
}

download_verified() {
    local out="$1"; shift
    local urls=("$@")
    local expected actual

    for url in "${urls[@]}"; do
        expected="$(remote_size "${url}" || true)"
        if [ -z "${expected}" ]; then
            echo "  [warn] cannot read size from ${url}, trying anyway"
            expected=0
        fi

        # Skip if local file already matches expected size
        if [ -f "${out}" ] && [ "${expected}" -gt 0 ] \
                && [ "$(stat -c%s "${out}")" -eq "${expected}" ]; then
            echo "  [skip] $(basename "${out}") already complete (${expected} bytes)"
            return 0
        fi

        echo "  [get]  ${url}"
        rm -f "${out}.aria2"
        if command -v aria2c >/dev/null 2>&1; then
            aria2c -x 16 -s 16 -k 1M --console-log-level=warn --allow-overwrite=true \
                --max-tries=5 --retry-wait=10 \
                -d "$(dirname "${out}")" -o "$(basename "${out}")" "${url}" || true
        else
            wget -c --tries=5 --timeout=60 --waitretry=10 -O "${out}" "${url}" || true
        fi

        actual="$(stat -c%s "${out}" 2>/dev/null || echo 0)"
        if [ "${expected}" -gt 0 ] && [ "${actual}" -eq "${expected}" ]; then
            echo "  [ok]   $(basename "${out}") (${actual} bytes)"
            return 0
        fi
        # If we couldn't read expected size but got >100MB, accept it for the VCF
        if [ "${expected}" -eq 0 ] && [ "${actual}" -gt 100000000 ]; then
            echo "  [ok]   $(basename "${out}") (${actual} bytes, size unverified)"
            return 0
        fi
        echo "  [fail] size mismatch: got ${actual}, expected ${expected}; trying next mirror"
    done
    return 1
}

download_verified "${VCF_PATH}" \
    "${VCF_BASE_PRIMARY}/${VCF_FILE}" "${VCF_BASE_FALLBACK}/${VCF_FILE}" \
    || { echo "VCF download failed on all mirrors"; exit 1; }

download_verified "${VCF_PATH}.tbi" \
    "${VCF_BASE_PRIMARY}/${VCF_FILE}.tbi" "${VCF_BASE_FALLBACK}/${VCF_FILE}.tbi" \
    || echo "  [warn] .tbi index missing; will rebuild later if needed"

download_verified "${PANEL_FILE}" "${PANEL_URL}"

# Verify gzip integrity (catches truncated downloads even when size matches)
echo "  [verify] testing gzip stream..."
gzip -t "${VCF_PATH}" || { echo "VCF is corrupt, delete raw/ and rerun"; exit 1; }
echo "  [ok]    gzip verified"

# Rebuild tabix index if missing
[ -f "${VCF_PATH}.tbi" ] || tabix -p vcf "${VCF_PATH}"

# -------- 2. bcftools pre-filter --------
# Strip multi-allelic sites, indels, and MAF<1% before PLINK ever sees the data.
# bcftools is multithreaded for (de)compression, much faster than PLINK's parser.
FILTERED_VCF="filtered/${PREFIX}_prefilt.vcf.gz"
if [ ! -f "${FILTERED_VCF}" ]; then
    echo "[2/8] bcftools pre-filter (biallelic SNPs, MAF >= 0.01)..."
    bcftools view \
        --threads ${THREADS} \
        -m2 -M2 -v snps \
        -q 0.01:minor \
        -Oz -o "${FILTERED_VCF}" \
        "${VCF_PATH}" \
        2> logs/02_bcftools.log
    bcftools index --threads ${THREADS} -t "${FILTERED_VCF}"
else
    echo "[2/8] Pre-filtered VCF already exists, skipping."
fi

# -------- 3. VCF -> PLINK binary --------
echo "[3/8] VCF -> PLINK binary..."
plink \
    --vcf "${FILTERED_VCF}" \
    --double-id \
    --allow-extra-chr 0 \
    --vcf-half-call missing \
    --set-missing-var-ids @:#\$1,\$2 \
    --biallelic-only strict \
    --snps-only just-acgt \
    --make-bed \
    --threads ${THREADS} \
    --memory ${MEMORY_MB} \
    --out "plink/${PREFIX}_raw" \
    > logs/03_vcf2plink.log

# Strip "chr" so ADMIXTURE accepts the chromosome code
awk 'BEGIN{OFS="\t"} { sub(/^chr/, "", $1); print }' \
    "plink/${PREFIX}_raw.bim" > "plink/${PREFIX}_raw.bim.tmp" \
    && mv "plink/${PREFIX}_raw.bim.tmp" "plink/${PREFIX}_raw.bim"

# -------- 4. Genotype-level QC --------
echo "[4/8] PLINK QC (missingness, HWE, MAF)..."
plink \
    --bfile "plink/${PREFIX}_raw" \
    --geno 0.02 \
    --hwe 1e-6 \
    --maf 0.05 \
    --make-bed \
    --threads ${THREADS} \
    --memory ${MEMORY_MB} \
    --out "plink/${PREFIX}_qc" \
    > logs/04_qc.log

# -------- 5. LD pruning --------
echo "[5/8] LD pruning (50 kb / 5 SNP / r^2 < 0.2)..."
plink \
    --bfile "plink/${PREFIX}_qc" \
    --indep-pairwise 50 5 0.2 \
    --threads ${THREADS} \
    --memory ${MEMORY_MB} \
    --out "pruned/${PREFIX}_indep" \
    > logs/05_ldprune_step1.log

plink \
    --bfile "plink/${PREFIX}_qc" \
    --extract "pruned/${PREFIX}_indep.prune.in" \
    --make-bed \
    --threads ${THREADS} \
    --memory ${MEMORY_MB} \
    --out "pruned/${PREFIX}_pruned" \
    > logs/05_ldprune_step2.log

# -------- 6. PCA --------
echo "[6/8] PCA (10 components)..."
plink \
    --bfile "pruned/${PREFIX}_pruned" \
    --pca 10 header \
    --threads ${THREADS} \
    --memory ${MEMORY_MB} \
    --out "pca/${PREFIX}_pca" \
    > logs/06_pca.log

# Merge eigenvectors with population labels for plotting
awk 'NR==FNR { pop[$1]=$2"\t"$3; next }
     FNR==1   { print $0"\tpop\tsuper_pop"; next }
              { key=$2; if (key in pop) print $0"\t"pop[key]; else print $0"\tNA\tNA" }' \
    "${PANEL_FILE}" "pca/${PREFIX}_pca.eigenvec" \
    > "pca/${PREFIX}_pca.labeled.tsv"

# -------- 7. ADMIXTURE in parallel --------
echo "[7/8] ADMIXTURE K = 2..8, 5-fold CV (${ADMIX_PARALLEL} parallel x ${ADMIX_THREADS} threads)..."
cd admixture
ln -sf "../pruned/${PREFIX}_pruned.bed" .
ln -sf "../pruned/${PREFIX}_pruned.bim" .
ln -sf "../pruned/${PREFIX}_pruned.fam" .

run_one_K() {
    local K="$1"
    admixture --cv -j${ADMIX_THREADS} "${PREFIX}_pruned.bed" ${K} \
        > "../logs/07_admixture_K${K}.log" 2>&1
    echo "  done K=${K}"
}
export -f run_one_K
export ADMIX_THREADS PREFIX

printf "%s\n" 2 3 4 5 6 7 8 \
    | xargs -n1 -P ${ADMIX_PARALLEL} -I{} bash -c 'run_one_K "$@"' _ {}

grep -h "CV error" ../logs/07_admixture_K*.log \
    | sort -k4 -t'=' -n > cv_errors.txt
cd ..

# -------- 8. Summary --------
echo "[8/8] Done."
echo "  Raw VCF:                  ${VCF_PATH}"
echo "  Pre-filtered VCF:         ${FILTERED_VCF}"
echo "  PCA table with labels:    pca/${PREFIX}_pca.labeled.tsv"
echo "  PCA eigenvalues:          pca/${PREFIX}_pca.eigenval"
echo "  ADMIXTURE Q matrices:     admixture/${PREFIX}_pruned.K.Q (per K)"
echo "  Best K (lowest CV error): admixture/cv_errors.txt"
