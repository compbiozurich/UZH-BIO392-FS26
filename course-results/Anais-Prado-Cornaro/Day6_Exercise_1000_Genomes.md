
# Task 1: Estimate Storage Requirements for 1000 genomes

## Definition WES & WGS

WES = Whole Exome Sequencing

WGS = Whole genome sequecing

### Assumptions
The __Exome__ refers to the entirety of all exonic regions within the genome. According to Wikipedia, the Exome consists of about __$30 * 10^6$__ bp, which corresponds to 1.1% of the entire genome.
The __Genome__ refers to all of the genetic information within a cell. Here I will use __$30 * 10^9$__ bp as the genome length.

- Human genome size: ~3 billion base pairs (3 × 10⁹ bp)
- WGS coverage: 30x 
- WES coverage: 100x __$30 * 10^6$__ bp


So if we only had to store bases (without any descriptive informaiton or annotations), 

$$\text{ bytes for 1000 WES genomes}  = (100 * 30 * 10^6 * 10^3 * 2)/8 = 7.5 * 10^{11} \text{ bytes}$$

$$\text{ bytes for 1000 WGS genomes}  = (30 * 30 * 10^9 * 10^3 * 2)/8 = 1.8 * 10^{15}\text{ bytes}$$

## Storage Size estimates for different file formats
### FASTA
- I assumed the genome size of an _uncompressed_ fasta file _per genome_ to be _~3 GB_.
- I assumed the genome size of a _compressed_ fasta file _per genome_ to be _~1 GB_.

| format | assumed Size / genome | × 1,000 genomes |
|-------|----------------|-----------------|
| Uncompressed | ~3 GB | ~3 TB |
| Compressed | ~1 GB | ~1 TB |


### SAM (Sequence Alignment Map)
Is a text-based format, which was developped for the alignment of a sequence to a refernce sequence. It's usecases largerly include NGS sequencing data, but it can also store unmapped sequences. 

| data stored | assumed Size / genome | × 1,000 genomes |
|-------|----------------|-----------------|
| WGS 30x (uncompressed) | ~300 GB | ~300 TB |
| WES 100x (uncompressed) | ~10 GB | ~10 TB |


### BAM (Binary Alignment Map)
Is the binary (compressed) version of a SAM file. This makes it less readable for humans, but more efficient storage-wise.

| data stored | assumed Size / genome | × 1,000 genomes |
|-------|----------------|-----------------|
| WGS 30x | ~100 GB | ~100 TB |
| WES 100x | ~4 GB | ~4 TB |

### VCF (Variant Cell Format)

| data stored | assumed Size / genome | × 1,000 genomes |
|-------|----------------|-----------------|
| Uncompressed | ~1 GB | ~1 TB |
| Compressed | ~200 MB | ~200 GB |


## Storage Cost estimates for different file formats
Based on the slides:
- 1 PB ≈ 35,000 CHF
- Real cost with duplication, facilities, and service ≈ __500,000 CHF / PB__

| Format | Storage Needed | Estimated Cost (real) |
|--------|---------------|----------------------|
| SAM (WGS) | ~300 TB | ~150,000 CHF |
| BAM (WGS) | ~100 TB | ~50,000 CHF |
| VCF (compressed) | ~200 GB | ~100 CHF |
| FASTA (compressed) | ~1 TB | ~500 CHF |

## Use cases:

### FASTA
FASTA is used for storing a reference genome or assembled sequences. It is not used for storing individual sequencing reads directly (FASTQ is menat for that). FASTA is ideal for __archival purposes__.

### SAM
Human-readable aligned reads (plain-text version of BAM). __Not recommended for storage__ due to required storage size — it should only be used for steps where text-based format is useful.

### BAM
Is the __standard format for storing aligned sequencing reads__. It offers ~3× compression compared to SAM. BAM files store full read-level information including quality scores and mapping positions. This makes it suitable for __variant re-calling, and archival purposes__. But 100 TB for 1000 WGS genomes is still significantly high!

### VCF
VCF stores only __called variants__ (SNPs, indels, SVs) in relation to a reference genome (not raw reads). It is the preferred format for __storing, sharing, and analyzing genetic variants__. It is also ideal for __annotation, and browser visualisation__ (e.g., via IGV). It is __not__ suitable for __full archival__ since raw read data is not stored.

## Conclusion
For 1,000 genomes, the recommended storage strategy depends on the goal:
- __Active analysis:__ BAM (WGS) at ~100 TB, ~50,000 CHF
- __Variant database / sharing:__ VCF at ~200 GB
- __Long-term archive with re-analysis potential:__ CRAM as a cheaper alternative to BAM
- __SAM shows no benefit__ for storage: 3× the size of BAM 
