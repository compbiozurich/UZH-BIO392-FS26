
# Task 1: Estimate Storage Requirements for 1000 genomes

## Definition WES & WGS

WES = Whole Exome Sequencing
WGS = Whole genome sequecing

The __Exome__ refers to the entirety of all exonic regions within the genome. According to Wikipedia, the Exome consists of about __$30 * 10^6$__ bp, which corresponds to 1.1% of the entire genome.
The __Genome__ refers to all of the genetic information within a cell. Here I will use __$30 * 10^9$__ bp as the genome length.

## Storage required for different file formats
### SAM (Sequence Alignment Map)
Is a text-based format, which was developped for the alignment of a sequence to a refernce sequence. It's usecases largerly include NGS sequencing data, but it can also store unmapped sequences. It supports reads up to a length of (128Mbp)

### BAM (Binary Alignment Map)
Is the binary version of a SAM file. This makes it less readable for humans, but more efficient storage-wise.

### VCF
### FASTA

## Calculations
### Without annotations (raw sequence)
So if we only had to store bases (without any descriptive informaiton or annotations), 
"""
bytes for 1000 WES genomes = $$(30 * 10^6 * 10^3 * 2)/8 = (60 * 10^9)/8 = 7.5 * 10^9 bytes$$ 
"""
"""
bytes for 1000 WGS genomes = $$(30 * 10^9 * 10^3 * 2)/8 = (60 * 10^12)/8 = 7.5 * 10^12 bytes$$ 
"""

## Use cases:

### For storing called variants


### For full archival purposes

### For browser visualization


# Task2: Exploring Genome Resources


# Task 2: Survival analyses | Cancer classificaiton | Staging