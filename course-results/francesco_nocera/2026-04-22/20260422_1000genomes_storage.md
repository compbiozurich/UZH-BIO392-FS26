

# Task: Estimate Storage Requirements for 1000 Genomes
## How much computer storage is required for 1000 Genomes

**Forewarning: i took some informations from sources on the internet, because the slides are messy and confusing and sometimes non-informative**

**i added the reference at the end of each subchapter**


using the assumption from slides: 1 whole genome sequence = 750 MB

## WES & WGS
### following numbers are to calculate whole double stranded sequences of one human genome with the required coverage
- WES = whole exome sequencing (i.e all protein coding sequences, no non-coding loci like rgulatory elements or introns)

    - --> contains only ~1% of the whole genome, but 100x mean coverage is the standard in reasearch

            715 MB * 1% * 100xcoverage = 715MB  (no file format or compression, just storage for this amount of bases in a binary format, where every 2 bytes correspond to 1 base)

- WGS = whole genome sequencing (i.e whole genome sequence)

    - --> contains the whole genome, at 30x to 50x mean coverage

            715MB * 30-50xcoverage = 21’450 - 35’750 MB = 20,95 GB - 34.91 GB (no file format or compression, just storage for this amount of bases in a binary format, where every 2 bytes correspond to 1 base)

> my reference for the coverages: https://emea.illumina.com/science/technology/next-generation-sequencing/plan-experiments/coverage.html

However, the 715MB assumption is based on 2bit = 1 byte = 1 base 'logic'. I guess the sequencing data has the classic text file 'logic' with 8bit = 1 byte = 1 base(or any character) and it makes the size of sequencing data 4x bigger 

---



## Different file formats


### SAM
Sequence alignment/map format --> 
contains data of sequence(s) (e.g raw sequencing reads) aligned against a reference sequence, contains for each alignment(if multiple) 11 mandatory with flags, metadata, read alignment type (i.e if to reverse strand), read complement(normally we get a forward and reverse read in sanger sequencing) and quality scores. It is a human readable file format, larger in storage and not really used for computing. For computing or storage the binary version BAM is used.

I won't claculate the file size, since it would not make sense to store it longterm as SAM.
>my refernce: https://pmc.ncbi.nlm.nih.gov/articles/PMC2723002/
### BAM
BAM (binary alingment/map file) is the binary format of SAM files, much smaller in storage size. 

For the calculation, I assume you meant the size of BAM files of 1000 genomes raw sequencing data where 1 whole whole genome raw 30x sequencing data is 100GB big


1000WGS BAM files:
        
    100GB (one genome raw 30x) * 1000genomes = 100'000GB =  97.6 TB

1000WES BAM file:
    
    1000bp * 1% * 1000genomes = 1000GB ~= 1TB


>my reference: https://pmc.ncbi.nlm.nih.gov/articles/PMC2723002/


Seems very big, but one could also not do it for all 1000 whole genomes at the same time, but only keep the regions that differ and are actually of interest, or regions where there is not very clear what the resut is to keep it for future analysis. And for long term storage CRAM would be with the same information but compressed size.

---


### VCF

The VCF file format contains only the loci that are diffeernt from the referece genome,i.e only the variants (or the loci where any of multiple sequences differs from the reference). so the size depends on the number of variants in all samples and the number of overlaps among these variant sites (a big overlap would decrease) and the number of samples/genomes. We heared in the lecture, that there are many variants that are common among many populations.


I assume you meant one VCF with 1000 genomes.

**1000WGS VCF**
My assumptions for the calculation:
- 100 million variant sites among all 1000 genomes
- 1 variant info (row with one specific variant info for all genomes) = 5000 characters = 5KB

        5 kb * 100'000'000variant sites = 500’000’000kb = 0.5TB

**1000WES VCF**
My assumptions for the calculation:
- 1 million variant sites among all exons in 1000 genomes (assuming variant sites are distributed randomly across coding and non-coding sequences)
- 1 variant info (row) = 5 KB

        5kb * 1'000'000 variant exon sites = 5'000'000 kb = 4.8GB 

VCF files have also a binary version 'BCF' that is not human readable anymore but reduce file size by ~20%. Or there is also the VCF.gz file which is just zip compressed
>my reference: https://samtools.github.io/hts-specs/VCFv4.2.pdf
---
### FASTA
Simple text format of bases of any sequence or multiple, each sequence has a header starting with '>' and some metadata like sample name of sequencing method or other . Is 'human readable' (if someone can read and process that many bases and find any conclusions). One character in a text file corresponds to one byte (= 8 bits = 2^8 possibilities, each encoding for a type of character) **(learned that in other bioinformatic courses, so no reference given)**

I am not sure what you want us to calculate, I assume it is just the whole genome sequence (with 1x coverage) after alligning all reads and assembling them to the whole genomes as 46 contigs per human. If you meant all raw reads after sequencing, just multiply by expected coverage (without headers)

I would assume each chromosome is a separate sequence with its own header. I randomly assume the mean length of all headers is 40 charactersincluding spaces

**WGS 1000genomes fasta**

 
    1000genomes * 1B * (6Gbp + 46headers * 40characters) = 6’000’001’840’000 B = 5.46 TB

**WES 1000genomes fasta**

I would not store exons as fasta format, since each exon would get it's own header and it would get even more unnecessary big (assuming each of our ~20'000 proteins has 10 exons, the file would get bigger by 40B * 10 * 20'000 = 16'000'000). And exons do not explain all variation phenotypical variation because a lot is due to regulatory processes that are in non-coding regions. And If we have the whole sequence and somebody really wants to study only exons, it can be derived from WG fasta .   

---
### Usage
For full archival purposes, I would store fasta files with assembled genomes. For browser visualisation of variants, the VCF file is enough. BAM file with raw 30x sequencing data contain redundant information (because of multiple coverage), so it would be easier to 'compress' that information into assemblies as whole 1x covered genomes and store it. However, it makes the data processing not reproducable without the raw sequenced data. So one could store as BAM the raw 30x sequences at postitions where the mapping is not very conclusive (for future analysis)

---
## Associated costs

### Cost factors
Do you mean cost factors for sequencing itself or only the storage part? Not specified, i assume it is just cost
factors for storage:
- type of files and their content redundancy (e.g only raw sequences or assemblies or variants)
- type technical devices to actually store the information
- number of backups
- buildings
- building facilities like cooling (or toilets for staff)
- maintenance staff
- rate of checking storage status (i.e. if they check if all stored infromation is intact every year or every 10 years)
- long term: unpredictable climatic or political changes (i.e. if economy gets bad due to bad politics, the staff may leave if not paid better, or climatic catastophes that require change of location or adapting buildings like better cooling and installation)
### Raw Storage costs
I assume you meant just how much does the amount of storage devices cost per files size for the above mentioned files

cost 1 PB status april 2026: 1PB = 65 * 510CHF = 33'150 CHF

| file type | file size | raw storage costs |
| --------- | -: | -: |
| BAM | 97.6 TB | 0.0976 PB / 1PB * 33'150CHF = 3’235.45 CHF |
| VCF | 0.5 TB | 0.0005 PB / 1 PB * 33'150CHF = 16.575 CHF |
| FASTA | 5.46 TB | 0.00546 PB / 1 PB * 33'150CHF = 180.999 CHF

---
---

### Familiarize with VCF format
the 'variant call format' is used to store only the variants observed in one/multiple sequences/genomes when compared to a reference sequence/genome. It consists of a header and a body.

**Structure:**
- Header:
    
    - is located at the beginning of the file
    - each header row starts with '#'
    - it contains information about the sequences (metadata)
    - it contains information describe columns in the body (e.g. INFO, FILTER or FORMAT)
    - is important to make data shareable (i.e to use the FAIR principles), so that they are reproducable and interpretable for other people 
- Body:
    - consists of at least 8 columns and possibility for additional
    - content of the 8 columns:
        - CHROM: name of reference sequence (i.e sequence against the other sequences called against)
        - POS: position of the variant described in the given row
        - ID: list of (if multiple variants present at given position) identifiers for the type of variant (if there is one). The identifieer of a variant is unique
        - REF: base of the reference at given position
        - ALT: allele of the sequence(s) or list if multiple at given position, can be longer than one base if it is e.g. an insertion
        - QUAL: quality score of variant(s), i.e the probability that the variant call is wrong
        - FILTER: indicates using specific codes if/which filters did the variant pass (best is 'PASS' if the call passed all filters)
        - INFO: information about the variant call (e.g. if it was validated in follow-up experiments), also with specific codes


>my reference: https://samtools.github.io/hts-specs/VCFv4.3.pdf

## Bonus task - IBM 350

Was the first hard disk drive (to get commercially). It could store up to 3.5MB. If 1000 whole genomes were to store with IBM350  in FASTA, it would take:


    5.46 TB = 5725224.96 MB
    5725224.96 MB / 3.5 MB = 1’635’778.56 IBM350 devices for FASTA with 1000 genomes

Assuming one would store all these IMB devices on a plane(geometrically) it would take 1’635’778.56devices * (150cm * 74cm) =  1.8 km^2 for fasta(252 soccer fields) and this is after processing the raw sequencing data. 

-->it would have been a nightmare to do the 1000genome project at these times. 

And according to Wikipedia ([link](https://en.wikipedia.org/wiki/History_of_IBM_magnetic_disk_drives#IBM_350)) the IBM350 storage unit was not sold, but only leased for 3200$ as part of the  IBM 305 RAMAC computer. This would mean 1’635’779 * 3200$ = **5’234’492’800 $ per month** for simple fasta files of 1000 genomes

---
**Personal comment:**

For next year please be more specific what exactly is to be calculated, we could answer this task in so many ways