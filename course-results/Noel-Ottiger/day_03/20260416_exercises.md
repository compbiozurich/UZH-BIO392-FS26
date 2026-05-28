# Day 03 - 2026-04-16
## Exercise 1 - Progenetix Tasks
### Task 1 
> Find one cancer type of your choice in Progenetix. Write down:
> - Its classification label
> - The number of matched samples or profiles 
> - One broader parent category, if shown

- Lung Neuroendocrine Neoplasm (NCIT:C5670)
- [Link to Entry]((https://progenetix.org/subset/?id=NCIT:C5670))
- 1817 samples
- 58 direct NCIT:C5670 code matches

### Task 2
> Search for one gene, for example, CDKN2A; Check what kind of CNV-related query result is
shown

- Matched Samples: 65579
- Retrieved Samples: 200
- **Variants: 70321**

## Exercise 2 - Paper Questions
### Why is it important to construct a CNV map on healthy individuals of various ethnicities?
A CNV map of healthy individuals serves as a reference catalogue of benign variation, which is important to discriminate pathogenic or high-risk variants from benign variants in patients.

### What CNV size did the authors define?
The authors defined CNVs as genomic segments larger than 50 bp. The current map includes microscopic and submicroscopic variants ranging from 50 bp to 3 Mb.

### What are the primary approaches used for CNV detection? And what are the advantages and limitations of these technologies?
Microarrays:

- Advantages: Array CGH is more sensitive for detecting duplications and small differences in copy number; suitable for quantitative variants.
- Limitations: Limited breakpoint resolution; lack of probes in regions containing segmental duplications; older platforms (e.g., BAC CGH) overestimate breakpoints and miss small variants; SNP arrays miss more duplications than CGH.

Next-generation sequencing:

- Advantages: High sensitivity; single-nucleotide breakpoint resolution; detects smaller variants; can be applied genome-wide and at scale (e.g., 1000 Genomes Project).
- Limitations: Biased toward detection of deletions; misses many duplications; low-coverage sequencing under-represents larger variants; private/rare variants may be missed.

### The authors used clustering method to combine data from different studies into merged CNVRs (Copy number variable regions). What are the two criteria for cluster filtering? And why did they do this filtering?
The clusters of overlapping CNVs were filtered based on:

- Number of distinct subjects carrying the variant.
- Number of distinct studies with at least one variant in the cluster.

Rationale:

- The subject filter excludes singletons, since variants supported by more subjects are less likely to be false positives.
- The study filter excludes study-specific artefacts (platform-specific or algorithm-specific calls), since variants reported across multiple independent studies are more reliable.

### What are thresholds in stringency level 1, inclusive map (stringency level 2), and stringent map (stringency level 12) respectively?
- Stringency level 1: 1 or more subjects, 1 or more studies (includes all singletons)
- Inclusive map (level 2): 2 or more subjects, one or more 1 studies
- Stringent map (level 12): 2 or more subjects, 2 or more studies

### Which percentage of the genome contributes to CNV in inclusive map and stringent map respectively?
- Inclusive map: 9.5% of the genome (3.9% gains, 7.5% losses).
- Stringent map: 4.8% of the genome (2.3% gains, 3.6% losses).

### By your intuition, which kind of genes are more variable between protein-coding genes and non-coding genes? How about their findings in this paper?
- Non-coding genes should be more variable, since protein-coding genes are under stronger purifying selection (loss-of-function tends to be deleterious).
- Idea is confirmed. Exons of non-coding genes showed the highest proportion of CNV sequence. 

### The authors generated a null CNV map and found genes for which at least 85% of the exons were homozygous deleted. What are the functions of these genes? And why did the authors say that they seem to be non-essential?
- The authors identified 107 protein-coding genes in which at least 85% of exons were homozygously deleted in apparently healthy individuals.
- Functions enriched in CNVRs include:
  - Xenobiotic, drug, and steroid metabolism
  - Immune response
  - Olfactory receptors

**Why are these genes non-essential?**

- They are missing from the genomes of apparently healthy individuals, so they cannot be required for survival to reproductive age.
- Many have paralogues (14 of them), suggesting functional redundancy within gene families.

### If you are a medical doctor, how do you use this map as a tool to assess the clinical importance of a CNV?
- Check whether the CNV is present in the CNV map
- Check whether the CNV overlaps medically relevant genes
- Compare inclusive vs stringent maps
- Consider genomic background
- Also: limitations -> CNV present in both maps that overlaps a disease gene may still be pathogenic with reduced penetrance, so map presence alone does not exclude clinical relevance

## Exercise 3 - Notebooks
- Answered questions in notebook `20260416_intro_progenetix.ipynb`
- Answered questions in notebook `20260416_intro_classification.ipynb`