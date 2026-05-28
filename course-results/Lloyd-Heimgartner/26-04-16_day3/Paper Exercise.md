
## Q1. Why is important to construct a CNV map on health individuals of various ethnicities?
Creating a CNV mao on healthy individuals is important as it provides a baseline to which other CNVs can be compared to. It allows researchers to identify which CNVs are benign and which are pathogenic, so they can detect diseases better and adjust the treatement accordingly. Creating these CNV maps for various ethnicities is important to mitigate biases in the data as different populations can have other variations in benign and pathogenic CNVs.


## Q2. What is the CNV size that the authors deﬁned?

The authors defined the cnv size between at least 50bp and 3 Mbp (50bp ≤ cnv size < 3 Mbs).

## Q3. What are the primary approaches used for CNV detection? And what are the advantages and limitations of these technologies? (CNV discoveries)


Microarrays and next-generation sequencing (NGS) are now the primary approaches used for CNV detection.
The shared limitation is that no single discovery strategy can capture the entire spectrum of structural variations in the genome.

Strength of NGS:
 + high sensitivity and the ability to provide accurate sequence-level breakpoint resolution

Weaknesses of NGS:
  - Can miss duplications

  - biased towards the detection of deletions

Strenth of Microarrays:
+ suitable for studying quantitative variants
+ Duplications are more readily detected than NGS

Weaknesses of arrays:
- limited resolution capacity for small CNVs

## Q4 The authors used clustering method to combine data from different studies into merged CNVRs (Copy number variable regions). What are the two criteria for cluster ﬁltering? And why did they do this ﬁltering? (The CNV map)

The two criteria are:	
- Every possible variant pair has at least 50% reciprocal overlap. This requirement ensured that structurally distinct CNVs were not merged at this stage.
- Clusters were then filtered on the basis of the number of distinct subjects that carry the variant and the number of distinct studies with at least one variant in the cluster.

The filter based on the number of subjects excluded singletons, and variants that are supported by a larger number of subjects are less likely to be false positives. The filter based on the number of studies ensured the exclusion of potential study-specific artefacts.

## Q5 What are thresholds in stringency level 1, inclusive map (stringency level 2), and stringent map (stringency level 12) respectively?

- threshold strignecy level 1: only at least one subject and one study
- threshold strignecy level 2: at least two subjects and one study for each variant
- threshold strignecy level 12: at least two subjects and two studies
## Q6. which percentage of the genome contributes to CNVs in inclusive map and stringent map respectively ?

- Inclusive map: 9.5% of the genome contributes to CNVs
- Stringent map: 4.8% of the genome contributes to CNVs

## Q7. By your intuition, which kind of genes are more variable between protein-coding genes and non-coding genes? How about their ﬁndings in this paper?
By my intuition non-coding genes are more variable as their variance isnt as impactful as if they were coding, so from an evolutionary standpoint its better when live enabling mechanisms (protein-coding genes) are less variable. The paper discovered that protein coding genes are less variable than the exons of non-coding genes.

## Q8. The authors generated a null CNV map and found genes for which at least 85% of the exons were homozygous deleted. What are the functions of these genes? And why did the authors say that they seem to be non-essential?

These genes are associated with late-onset phenotypic consequences that do not substantially reduce the fitness such as osteoporosis, susceptibility to multiple sclerosis, autoimmune disease, coeliac disease, placental function and fetal wellbeing, determining the Rh-negative blood type, delayed AIDS progression from HIV-1 infection.
The authors said that these genes seem non-essential, as their function may be redundant and don't substantially reduce fitness.

## #Q9. If you are a medical doctor, how do you use this map as a tool to assess the clinical importance of a CNV? (Clinical application of the CNV map part in Discussion)

If I were a medical doctor and found a CNV in a patient there are two criteria/tools i would use to asses theits clinical importance:

  1. Check whether the CNV appears in the CNV map, if it is present among the CNVRs of healthy individuals, it is more likely benign.
  2. Check whether it overlaps with medically relevant genes, like disease associated genes and if it isnt in the CNV map of healthy indiciduals it strongly hints towards medical / pathogenic importance.
