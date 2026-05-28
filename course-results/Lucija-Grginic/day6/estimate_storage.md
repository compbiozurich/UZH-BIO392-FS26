## Task: Estimate Storage Requirements for 1000 Genomes

### WES vs WGS


WES stands for whole exome sequencing. This captures only 1-2% of the genome that is protein coding.<br>

WGS is whole genome sequencing. This method sequences the whole DNA length, including coding and non-coding regions, as well as regulatory parts.


### Different file formats:


**SAM**: sequence alignment map
- This is used to save alignment information of various reads mapped against reference sequences. It is human-readable, but it is quite voluminous, thereby, not suitable for long-term storage. 


**BAM**: binary version of SAM
- This is a compressed version of a SAM file. Because of its binary format, it is not human-readable, however good for storage due to its smaller size. According to the internet (https://samtools.org), BAM files are substantially smaller than SAM files, sometimes by a factor of four or more. Additionally, it is faster to query.


**VCF**: variant call format
- This data format is standard for genomic variant representation and storage. It is appropriate to use when we are interested in storing (single or multiple) interpretations of genome sequence variants in comparison to a reference genome. 


**FASTA**: FAST-All
- This data format can be used when we need to look at the sequence itself, not alignments. It gives you a linear annotation of single letter nucleotides or amino acid codes. For example, it is good to store reference genomes, plasmid sequences, primer sequences or even CRISPR guides. However, it is not optimized for size as it is a text-format (therefore, human-readable). 


### Storage size and associated costs required for 1000 genomes<br>
If we say one whole perfect genome is ~715 Mb in .2bit format, and I want to store 1000 genomes, I would need ~715 Gb in this format. <br>
FASTA equivalent of this is about 3Tb (FASTA stores 1 nucleotide per 1 byte, while the .2bit stores 4 nucleotides per 1 byte). 


On the other hand, if I want to align my sequence with a reference and store it into BAM, much more storage will be needed. If a single 30x BAM file is about 100 Gb per genome, we would need 100Tb for our 1000 genomes. 

If we want SAM format, that is human-readable, we will need even more storage and deal with higher costs. SAM file is, as said before, about 4 times (even more) larger than BAM files. Therefore, for our purposes about 400Tb would need to be available.

Considering costs, assuming 1 genome in a BAM format costs 50CHF (from slide 22), these 1000 genomes in BAM format would be around 50000CHF, while SAM format would lead to much substantial amount, around 200000CHF.
Accordingly, FASTA format that only needs 3Tb will be 50000chf/(100tb/3tb) = ~1500CHF. 




### Bonus task ###
The IBM storage unit 350 from the picture could hold the equivalent of 62,500 punched cards: 5 million characters (which is about 3.75 MB). It was the first storage device with random access to large data volumes. It consisted of 52 disks stacked on a rotating spindle. Its weight was astonishing 1 ton and to rent it, one would need to pay 3,200 US dollars a month during that time. 

For comparison, to store my 1000 genomes only in the .2bit file format I would need 190 million of those IBM 350 units!



