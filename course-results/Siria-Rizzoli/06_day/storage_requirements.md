# Estimate storage requirements for 1000 Genomes 
## WES & WGS 
### WES
Whole exome sequencing sequences only the protein-coding regions of the genome, making up about the 1-2% of the DNA (30-60 million bp), and therefore resulting in a much more compact file to store. 
Looking at the data form WES one can derive mutations that are influencing protiens, but does not have any information about non-coding protein sequences, that can still be influential in diseases. 
{Bartha, Á., & Győrffy, B. (2019). Comprehensive Outline of Whole Exome Sequencing Data Analysis Tools Available in Clinical Oncology. Cancers, 11(11), 1725. https://doi.org/10.3390/cancers11111725}

So if 30x BAM file weigths 100 GB (from course material, slide 20 of 'Files and Resources'), then:
* *WES size:* 2% x 100 GB = 2 GB 
* *storage:* 2 GB x 1'000 = 2'000 GB = 2 TB
* *cost:* 50 CHF/genome x 2% x 1'000 = 1'000 CHF 


### WGS
Whole genome sequencing results in the entire sequencing of the genome, resulting in important-sized data files, because all 3 billion base pairs will be sequenced. 

If 30x BAM file weights 100 GB (from course material, slide 20 of 'Files and Resources'), then: 
* *storage:* 1'000 x 100 = 100'000 GB = 100 TB 
* *cost:* 50 CHF/genome x 1'000 = 50'000 CHF

## File formats 
### Store called variants 
To store called variants, I would use VCF. VCF is allows to see variants in multiple samples at the same time, but you can ignore all the parts of the genome that are the same compared to the reference genome. 

Being that in average we have 5 million variants in our genome: 
* *estimate of size of one line:* 150 byte
* *size for 1 genome:* 5'000'000 x 150 = 750 MB
* *size for 1'000 genomes:* = 750 X 1'000 = 750 GB
These 750 GB are if each file is stored singluarly, if the 1'000 genomes were to be put all together in a file, and starting off the fact that each person has 1-4% of rare variants: 
* *rare variants:* 4% x 5 millions = 200'000
* *rare variants in 1'000 genomes:* 200'000 x 1'000 = 200'000'000
* *line length:* 150 byte + 5 byte x 999 = 5'145 (will use 5KB)
* *esitmate size:* (5'000'000 + 200'000'000) x 5'000 = 1'054 GB = 1.054 TB
* *cost:* 500'000/1'000 TB x 1.054 TB = 527 CHF

### Archivial purposes 
To store full sequences I would ideally go for CRAM for WGS or BAM for WES. 
CRAM is based on BAM but a compressed version, so it would be ideal to save space, especially if WGS is needed to be stored. 

* *30x BAM file:* 100 GB
* *total for 1'000 genomes:* 100 GB x 1'000 = 100'000 GB = 100 TB 
* *cost:* 50 CHF/genome x 1'000 = 50'000 CHF

* *CRAM file:* 100 GB - 30% x 100 GB = 70 GB
* *total for 1'000 genomes:* 70 GB x 1000 = 70 TB
* *cost:* 500'000/1'000 TB x 70 TB = 35'000 CHF 

### Browser visualization 
BED are commonly used for visualization, because it stores genomic regions as coordinates and associated annotations in a text-based manner. This file scales with entry submission, but one can decide how to set it up. In case of wanting to see all variants in all 1000 genomes this is not very useful, but if we want to filter them or choose aggregates this is the best format. 

* *line size with 3 columns:* 15-20 bytes 
* *look at coding-genes:* 20'000 x 20 bytes = 400 KB 
* *look at 1% variations:* (5'000'000 + 200'000'000) x 1% = 2.05 MB 

### Other formats 
* *SAM:* it is a readable version of the sequence as it is in text format. It is often converted to BAM format as this is binary and occupies less space and is faster to process. 
* *FASTA:* it is the main format for nucleotide and amino acid sequence representation. This is used as reference sequence for alignment.  

## IBM 350 
The IBM 350 was the first disk drive and it stored 3.75 MB, leasing for 3'200$ a month. 
If we had to store one 30x BAM file we would need: 
* 100'000 MB / 3.75 MB = 26'667 IBM 350 
* 26'667 x 3'200 $ = 85'334'400 $ = 66'814'275 CHF