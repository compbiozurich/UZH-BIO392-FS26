# Day 06 - 2026-04-22
## Exercise 1 - Reading Up on some Standards
> Genome coordinates
> VCF specification

## Exercise 2 - Make some Docs
> Create some mkdocs using `mkdocs serve`
> Install it first: `pip3 install mkdocs`

## Exercise 3 - Estimate Storage Requirements
> How much computer storage is required for 1000 Genomes

### Assuming perfect encoding
- Using two bits per base
- 4 bases per byte
- Assuming $3 \times 10^9$ bases per genome
- $2\times 3 \times 10^9$ bits per genome

**Yields approx. 715 MB per genome**

For 1000 genomes, we would need approximately 715 GB of storage.

*This is the theoretical lower bound. It encodes only the sequence, not quality scores, alignment, metadata, or variant calls.*

### More realstic
- 30x BAM file roughly 100 GB
- For 1000 genomes: ~100 TB (= 0.1 PB)

**Storing 1000 genomes on BAM would cost roughly CHF 50'000 using only storage costs. Not including replication, backup, rack fees, etc.**

### Overview
- Archival: CRAM (enables [reference-based] compression), storing only differences from the reference genome plus quality scores
- Variant calling: VCF, storing differences from reference genome plus quality scores, metadata, and variant calls
- Annotation, working with files, visualization: BAM, or indexed-BAM files. Apparently, also BigWig?
- Reference sequence: FASTA (~3 GB for GRCh38), FASTAQ if quality scores are needed

| Format | Compressed | Per genome | × 1000 genomes |
|---|---|---|---|
| **SAM** | No (text) | ~500 GB | ~500 TB (~0.5 PB) |
| **BAM** | Yes (binary) | ~100 GB | ~100 TB (~0.1 PB) |
| **CRAM** | Yes (reference-based) | ~30-60 GB | ~30-60 TB |
| **FASTA / FASTQ** | FASTA: no; FASTQ: gzip | FASTA ~3 GB; FASTQ ~80-100 GB | FASTA ~3 TB; FASTQ ~80-100 TB |
| **VCF** | gzip / binary | ~125 MB  | ~125 GB |
| **2-bit** | Maximal | ~715 MB | ~715 GB |

### IBM 350 & A4 Paper
- IBM 350 has/had storage of 3.75 MB per unit
- Typical A4 paper stores 3000 - 4000 characters per page

#### IBM 350 units required

| Storage target | Size | IBM 350 units (3.75 MB each) |
|---|---|---------------|
| 1 *perfect* genome | 715 MB | ~191 |
| 1000 genomes (2-bit) | 715 GB | ~191000 |
| 1 BAM genome (30×) | 100 GB | ~26700 |
| 1000 BAM genomes (30×) | 100 TB | ~26.7 million |

#### A4 Paper

| | A4 pages   | Stack height |
|---|------------|---|
| **1 genome** (2-bit, ~715 MB) | ~860,000   | ~86 m | 
| **1000 genomes** (2-bit, ~715 GB) | ~860 million | ~86 km |
| **1000 genomes** (BAM 30×, ~100 TB) | ~85 billion | ~8,500 km |