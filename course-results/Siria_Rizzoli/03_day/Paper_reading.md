---
output:
  pdf_document: default
  html_document: default
---
# A copy number variation map of the human genome 

### 1. Why is important to construct a CNV map on healthy individuals of various ethnicities?

Because a trait can have different effects depending on the environmental context. Not all CNV are disease-related, they are normal parts of the human genome, they can be healthy. 

### 2. What is the CNV size that the authors defined?

The authours defined the CNV size as larger than 50 bp and up to 3 Mb. The definition of CNV is a cyclic concept: it depends on the techniques that are present to identify them. 

### 3. What are the primary approaches used for CNV detection? And what are the advantages and limitations of these technologies? (CNV discoveries)

NGS – high sensitivity, but underrapresent the duplications and also large variations. 
Array based methods – lower resolution capacity (miss small variance), but detects more duplications. 

### 4. The authors used clustering method to combine data from different studies into merged CNVRs (Copy number variable regions). What are the two criteria for cluster filtering? And why did they do this filtering? 

* Sets of variants in which every possible variant pair had at least 50% reciprocal overlap. This ensured that structurally distinct CNV were not merged 
* Results were filtered based on the number of distinct subjects that carry the variant, this ensures that singletons are excluded,
and the number of distinct studies with at least one variant in the cluster, this excludes study artefacts

### 5. What are thresholds in stringency level 1, inclusive map (stringency level 2), and stringent map (stringency level 12) respectively? 

* stringency 1: every CNV (in 1 study or more)
* stringency 2: 2 subjects and 1 study for each variant 
* stringency 12: at least 2 subjects and 2 studies  

### 6. Which percentage of the genome contributes to CNV in inclusive map and stringent map respectively? 

*	Inclusive map: 9.5%
*	Stringent map: 4.8%

### 7. By your intuition, which kind of genes are more variable between protein-coding genes and non-coding genes? How about their findings in this paper? 

By my intuition I would say non-coding genes are more variable, because they probably are less evolutionarly conserved.

In the paper it is found that common deletions affect the protein-coding genes less than the rare variations, in non-coding regions there is less pressure and therefore more variations. 

### 8. The authors generated a null CNV map and found genes for which at least 85% of the exons were homozygous deleted. What are the functions of these genes? And why did the authors say that they seem to be non-essential? 

The functions of these genes are diverse and seem to be Age-related phenotypes, Rh-negative blood type, delayed AIDS, autoimmune diseases, …
These genes are defined as non-essentials because they are also deleted in healthy individuals. This goes to show that a deletion  isn't automatically clinically relevant, it depends on the gene that it affects. 

### 9. If you are a medical doctor, how do you use this map as a tool to assess the clinical importance of CNV?

I would use it to distinguish common CNV from malignant CNV. It would be useful to identify possible mutations, because if a CNV is present in an area that is usually never mutated, it has a high probability of being malignant. Whereas if a CNV falls in a commonly variant region in healthy individuals it is less probable to be disease-related. 
