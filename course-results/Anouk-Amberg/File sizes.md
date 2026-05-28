
# Exercises Friday

## How much computer storage is required for 1000 Genomes

Please provide 1page size estimates and reasoning for the use of the different file types (i.e. which would you use for storing called variants, which for full archival purposes, browser visualisation), for 3-5 formats.
• WES & WGS
• Different file formats
    • SAM
    • BAM
    • VCF
    • FASTA

## Answer

Computer storage for 1000 genomes

- Included data types: 
    - FASTQ
    - BAM
    - VCF

- Excluded data types: 
    - SAM (too large, not used for storage)
    - FASTA (reference genome, stored once ~3 GB)

### WGS

**One genome**:

- FASTQ ≈ 100 GB
- BAM ≈ 100 GB
- VCF ≈ 1 GB

**1000 genomes**

- FASTQ: 100 GB × 1000 = 100 TB
- BAM: 100 GB × 1000 = 100 TB
- VCF: 1 GB × 1000 = 1 TB

**Total WGS ≈ 201 TB (~200 TB)**

### WES

**One genome**

- FASTQ ≈ 10 GB
- BAM ≈ 5–10 GB
- VCF ≈ 0.1–0.5 GB

**1000 genomes**

- FASTQ: 10 GB × 1000 = 10 TB
- BAM: 5–10 GB × 1000 = 5–10 TB
- VCF: 0.1–0.5 GB × 1000 = 0.1–0.5 TB

**Total WES ≈ 15–25 TB**

### Comments

When comparing those three data storage types, 

- **Storing called variants**: I would use VCF for storing called variants, as it needs the lowest storage per genome.
- **Visualization in browser**: FASTQ (maybe BAM) for visualizing.
- **Archival purposes**: This depends what the data will be used for. In general, I would go for the VCF (or BAM) as    again, it has the lowest storage.