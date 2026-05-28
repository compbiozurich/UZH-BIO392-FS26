---
output:
  html_document: default
  pdf_document: default
---
## **BIO392 – Day 3**
### Article reading + questions

### **A copy number variation map of the human genome**

**1.	Why is important to construct a CNV map on health individuals of various ethnicities?**
Constructing CNV maps of healthy individuals from many ethnic groups is crucial because it defines our reference of baseline structural variations across different populations. This allows for proper discrimination of pathogenic or high-risk variants from benign variants in patients.


**2.	What is the CNV size definition that the authors defined?**
Note: the CNV size definition is still under debate and may be different in other literatures

The authors defines that CNV are larger than 50bp.

**3.	What are the primary approaches used for CNV detection? And what are the advantages and limitations of these technologies?**
a)	Microarrays:
 .	With large insert clones (BAC)
 .	Oligonucleotide arrays
 .	Comparative genomic hybridization (CGH)
 .	SNP-based arrays

Advantages: 
o	suitable to study quantitative variants
o	CGH good for reading duplications and more sensitive for detecting small differences in copy number

Disadvantages: 
o	BAC and CGH estimated of total CNV content are typically inflated owning to low resolution and overestimation of the breakpoints, miss small variants
o	limited resolution capacity

b)	NGS
Advantages: 
o	calls smaller variants and are biased toward the detection of deletions
o	high sensitivity and ability to provide accurate sequence level breakpoint resolution

Disadvantage:
o	underrepresents duplications and large variations

For both:
Disadvantages:
-	numerous platforms lacked probes in regions of the genome that contain segmental duplications – which predispose to structural variation – thus unable to recognize many CNVs that have been implicated in human disease
-	more duplications are missed by SNP based array and NGS approaches than by CGH array


**4.	The authors used clustering method to combine data from different studies into merged CNVRs. What are the 2 criteria for clustering filtering? And why did they do this filtering?**

One criteria was filtering based on subject: excluding singletons and variants that are supported by a larger number of subject are less likely to be false positives
Another criteria was filtering based on studies: exclusion of potential study-specific artifacts


**5.	What are the threshold in stringency level 1, inclusive map (stringency level 2) and stringent map (stringency level 12) respectively?**
Level 1: map supported only by a least one subject and one study 
Level 2: at least 2 subjects and one study of each variant
Level 12: at least 2 subjects and 2 studies

**6.	Which percentage of the genome contributed to CNV inclusive map and stringent map respectively?**
In the inclusive map: 9.5% of the human genome is involved with CNVs (gains and losses)
In the stringent map: 4.8% of the human genome is involved with CNVs (gains and losses)


**7.	By your intuition, which kind of genes are more variable between protein-coding genes and non-coding genes? How about their finding in this paper?**
I would say that genes for non-coding genes would be more variable as they are less likely to be of great importance.
In the paper: Exons of all genes were more variable than the genome average.
The exons of non-coding genes had the highest proportion of the CNV seq, which is higher than the exons of protein-coding genes.

**8.	The authors generated a null CNV map and found genes for which at least 85% of the exons were homozygous deleted. What are the functions of these genes? And why did the authors say that they seem to be non-essential?**
These genes are probably non-essential because they are found in apparently health individuals.
Their functions may be redundant or they are related to late-onset phenotypic consequences that do not substantially reduce the fitness. 
Some of the non-essential genes from their list are described in OMIM as age related phenotypes, Rh-negative blood type, delayed AIDS from HIV-1 infection, susceptibility to multiple sclerosis, autoimmune diseases and placental function and fetal well being.


**9.	If you are a medical doctor, how do you use this map as a tool to assess the clinical importance of a CNV?**
If I were a medical doctor I would use this CNV map to compare my patients CNVs with the CNV map. If a CNV found in a patient would not overlap with any of the CNV on the map, it would suggest this CNV is of medical importance and most likely not common/benign.






