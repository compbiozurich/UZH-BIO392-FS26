# How much computer storage is required for 1000 genomes 

## Definition WES & WGS
WES = Whole Exome Sequencing
WGS = Whole genome sequecing

The __Exome__ refers to the entirety of all exonic regions within the genome. According to Wikipedia, the Exome consists of about __30 Mb__, which corresponds to 1.1% of the entire genome.
The __Genome__ refers to all of the genetic information within a cell. Here I will use the __```$\displaystyle\30 * 10^9$``` bp as the genome length.

## Storage required for different file formats
### SAM (Sequence Alignment Map)
Is a text-based format, which was developped for the alignment of a sequence to a refernce sequence. It's usecases largerly include NGS sequencing data, but it can also store unmapped sequences. It supports reads upt o a length of (128Mbp)

### BAM (Binary Alignment Map)
Binary version of a SAM file.

### VCF
### FASTA

## Calculations
