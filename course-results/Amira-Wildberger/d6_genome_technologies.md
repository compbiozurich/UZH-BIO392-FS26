# Day 6 Exercise Genome Technologies: Storage Requirements for 1,000 Genomes
Please provide 1-page size estimates and reasoning for the use of the different file types (i.e. which would you use for storing called variants, which for full archival purposes, browser visualisation), for 3-5 formats. Submit your files (.md) per pull request to your Github directory.
## Genome Size Basis

The human genome contains **3'000'000'000 bases (3.0 Gb)**. At a theoretical minimum of 2 bits per base (encoding T, C, G, A as 00, 01, 10, 11), a perfect genome with no overhead (based on the slides) requires only:

2 × 3 × 10⁹ b = 6,000,000,000 bits = ~715 MB

In practice, real sequencing files are far larger due to coverage depth, quality scores, metadata, and read headers.



## Sequencing Types

There are two main sequencing strategies:

Whole Exome Sequencing (WES): targets only the protein-coding regions of the genome (~50 Mb, roughly 1.5% of the total), sequenced at high depth (100×) to ensure reliable variant detection in clinically relevant regions. This produces around 6–8 GB of raw FASTQ data per sample, or roughly 7 TB for 1,000 samples. 

Whole Genome Sequencing (WGS): covers the entire 3.0 Gb genome at 30× coverage, generating ~85–110 GB of raw data per sample — about 95 TB for 1,000 samples. The ~13-fold difference in raw data between WES and WGS reflects both the larger target region and the higher redundancy required for whole-genome accuracy.

---

## File Formats: Size Estimates for 1,000 Samples

### 1. FASTA — Reference / Consensus Sequences

FASTA is a plain-text format that stores nucleotide sequences as single-letter codes, with a leading header line containing a unique sequence identifier. It is human-readable but not optimised for size, and carries no quality scores or alignment information. The uncompressed human reference genome takes up about 3.0 GB; compressed with bgzip this drops to ~0.9 GB. Per-sample consensus FASTA files are similarly sized at ~3–3.8 GB each, totalling roughly 3.4 TB for 1,000 samples.

Use: Storing reference genomes and assembled consensus sequences. Not suitable for raw read data.

---

### 2. BAM — Binary Alignment/Map

BAM is the binary, gzip-compressed version of SAM. It reduces file size by roughly 3–5× while preserving all alignment information. A single 30× WGS BAM file is approximately 100 GB, putting 1,000 WGS samples at ~100 TB. WES samples are far more manageable at ~10 GB each (~10 TB for 1,000 samples), reflecting the much smaller target region.

Use: Browser visualisation & active analysis. The standard working format during analysis pipelines, with wide support in tools like IGV and the UCSC Genome Browser.

---

### 3. CRAM — Compressed Reference-based Alignment

CRAM stores only the differences between each read and the reference genome, rather than the full read sequences. Since ~99.9% of bases in a human sample match the reference, this reference-based approach achieves a further ~50–60% size reduction compared to BAM — bringing a WGS sample down to roughly 25–40 GB, and 1,000 WGS samples to ~30 TB. The trade-off is a dependency on the reference genome for decoding, which must be kept alongside the CRAM files.

Use: Preferred long-term archival. Used by the 1000 Genomes Project itself. The best choice when storage cost matters and active access is infrequent.

---

### 4. VCF — Variant Call Format

VCF stores only the positions where a sample differs from the reference genome — typically around 4–5 million variants per WGS sample. Each variant occupies a single text line of roughly 150 bytes, covering mandatory columns (CHROM, POS, ID, REF, ALT, QUAL, FILTER, INFO, FORMAT) followed by per-sample genotype calls. The file begins with mandatory header lines and optional metadata lines describing annotations. This design makes VCF extraordinarily compact: a WGS sample produces only ~750 MB–1.4 GB, meaning 1,000 WGS samples fit in ~1 TB — compared to 100 TB for the equivalent BAMs. Compressing with .vcf.gz and indexing with .tbi reduces this further by 5–10×. The gVCF variant retains evidence for all sites (not just variant sites), useful for joint genotyping, at a cost of ~9–14 GB per WGS sample (~11 TB for 1,000 samples).

Use: Storing called variants (SNPs, indels). The universal output of variant callers such as GATK and DeepVariant. The right choice once alignment data is no longer needed.

## Storage Cost Estimates

### On-premise hardware

Raw hardware alone is relatively affordable. A petabyte of storage built from 65× 16 TB drives cost around 35'000 CHF in 2021, and prices have remained broadly stable (approximately CHF 510 per drive as of April 2026). However, real-world costs are roughly double once duplication, power, facilities, and service are factored in — bringing the true cost to around 500'000 CHF per PB. Since a single 30× WGS BAM file is 100 GB, 1 PB accommodates ~10'000 genomes, putting the on-premise cost at roughly 50 CHF per genome in BAM format, or ~50'000 CHF for 1,000 genomes.

### Cloud storage (AWS S3)
 
AWS S3 pricing is listed in USD (current exchange rate of ~0.782 CHF/USD)
 
| Tier | Price/TB/month | 1,000× WGS BAM (~100 TB) | 1,000× WGS CRAM (~30 TB) |
|---|---|---|---|
| S3 Standard | ~18 CHF | ~1'800 CHF/month | ~540 CHF/month |
| S3 Glacier Instant | ~3 CHF | ~310 CHF/month | ~95 CHF/month |
| S3 Glacier Deep Archive | ~0.77 CHF | ~77 CHF/month | ~23 CHF/month |
 
Choosing CRAM over BAM and archiving to Glacier Deep Archive rather than S3 Standard reduces annual cloud costs from ~21'600 CHF to ~280 CHF for 1,000 WGS samples — a 75-fold difference driven entirely by format and tier choices. Additional cost factors include egress fees (~0.07 CHF/GB for retrieval), which favour keeping actively accessed data in Standard tier, and the need to always compress VCFs (.vcf.gz) for a further 5–10× size reduction at negligible cost.
