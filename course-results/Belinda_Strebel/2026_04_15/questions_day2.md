## Questions to paper: A copy number variation map of the human genome 

#### 1. Why is it important to construct a CNV map of healthy individuals of various ethnicities?
A CNV map built from healthy individuals of diverse ethnic backgrounds helps define which CNVs are likely benign rather than disease-causing and it captures population-specific variation that would be missed in a narrower sample (for example when only looking at one ethnicity). It also provides a reference for interpreting new CNVs in both research and clinical genetics, which is why we need healthy individuals as a reference). 
	
#### 2. What is the CNV size that the authors defined? 
The authors defined CNVs as genomic segments of at least 50 bp. They note that this size cutoff is still debated in the literature.

#### 3. What are the primary approaches used for CNV detection? And what are the advantages and limitations of these technologies?
the paper arrays-, NGS sequencing-based methods and Sanger-based validation as their main methods.

- **Arrays:** useful for genome-wide scanning, but they have lower breakpoint resolution and may miss smaller variants.
- **NGS/sequencing:** can detect smaller CNVs and gives better resolution, but coverage and calling biases can still limit detection, especially for some duplications and larger variants.
- **Sanger or targeted assays:** high breakpoint precision and high accuracy, but they are not genome-wide and are not practical for large-scale discovery.
	
The authors excluded PCR, FISH, and MLPA from their main map because these methods had low sensitivity and/or low resolution for genome-wide CNV mapping.
	
#### 4. The authors used a clustering method to combine data from different studies into merged CNVRs (Copey number variable regions). What are the 2 different criteria for cluster filtering? And why did they do this filtering? 
They filtered CNV clusters by two criteria:

- Number of distinct subjects carrying the variant, and
- Number of distinct studies containing at least one variant in the cluster.
	
They did this to remove likely false positives, especially singletons, and to exclude study-specific technical artefacts. Variants supported by more subjects are less likely to be false calls, and variants seen in multiple studies are less likely to be platform-specific noise.
	
#### 5. What are the thresholds in stringency level 1, inclusive map (stringency level 2), and stringent map (stringency level 12), respectively? 
The paper defines these stringency levels as follows:

- Stringency level 1: at least 1 subject and 1 study.
- Inclusive map / stringency level 2: at least 2 subjects and 1 study.
- Stringent map / stringency level 12: at least 2 subjects and 2 studies.
	
#### 6. Which percentage of the genome contributes to CNV in inclusive map and stringent map, respectively? 
The paper reports that the inclusive map covers about 9.5% of the genome, while the stringent map covers about 4.8%
	
#### 7. By your intuition, which kind of genes are more variable between protein-coding genes and non-coding genes? How about their findings in this paper? 
My intuition tells me that non-coding genes are more variable, since there might be less selective pressure against mutations and other changes, since the effects have little to no effect in most cases. And the paper says that exons of non-coding genes have the highest proportion of CNVs and are more variable than the exons of protein-coding genes. 

#### 8. The authors generated a null CNV map and found genes for which at least 85% of the exons were homozygously deleted. What are the functions of these genes? And why did the authors say that they seem to be non-essential? 
There are 107 protein-coding genes in which 85% or more of exons are homozygously deleted in healthy individuals. These genes tend to have more paralogues and are enriched in segmental duplications (could be because of redundancy or dispensability) 
Many of the genes seem to be functionally involved in traits which are variable between populations or have a late-onset effect:
osteoporosis, rh-neg blood, HIV progression, autoimmune-related traits
The authors call them non-essential because healthy individuals can completely lack them without obvious phenotypic consequences.
  
#### 9. If you are a medical doctor, how do you use this map as a tool to assess the clinical importance of a CNV? 
Could use as a reference to judge whether a patient's CNV is benign or potentially cli
