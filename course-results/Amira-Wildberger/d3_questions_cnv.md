# A copy number variation map of the human genome

## 1. Why is important to construct a CNV map on health individuals of various ethnicities?
Because a trait may be adaptive or maladaptive in different environments and also approximately 100 genes can be completely deleted without apparent phenotypic consequences. This means we need data from different ethnicities to assess whether specific CNVs are pathogenic.

## 2. What is the CNV size that the authors defined? (Box 1 mentioned in introduction) Noted: The CNV size definition is still under debate and may be different in other literatures
50bp to 30Mb

## 3. What are the primary approaches used for CNV detection? And what are the advantages and limitations of these technologies? (CNV discoveries)
No single discovery strategy. 
- Microarrays: Useful for genome-wide scanning. May miss many variants that are small.
- NGS/sequencing: Call smaller variants but are biased towards the detection of deletions.

## 4. The authors used clustering method to combine data from different studies into merged CNVRs (Copy number variable regions). What are the two criteria for cluster filtering? And why did they do this filtering? (The CNV map)
CNVs called from different studies can estimate partially different CNV boundaries. Different platforms have different degrees of accuracy for determining the beginning and end of the variants. CNVR-clustering algorithm to identify sets of variants in which every possible variant pair had at least 50% reciprocal overlap <- ensured that structurally distinct CNVs were not merged at this stage. Filtered clusters on the basis of number of distinct subjects that carry the variant and number of distinct studies with at least one variant in the cluster

## 5. What are thresholds in stringency level 1, inclusive map (stringency level 2), and stringent map (stringency level 12) respectively? (The CNV map)
Stringency level 2: at least two subjects and one study for each variant; Stringency Level 12: at least two subjects and two studies for each variant

## 6. Which percentage of the genome contributes to CNV in inclusive map and stringent map respectively? (Properties of the CNV map)
Inclusive/Stringency level 2: 9.5% of the human genome involved with losses (7.5%) and gains (3.9%); Stringent/Stingency level 12: 4.8% of the human genome involved with losses (3.6%) and gains (2.3%); 50% less than the inclusive map

## 7. By your intuition, which kind of genes are more variable between protein-coding genes and non-coding genes? How about their findings in this paper? (Functional impact of CNV)
Exons of non-coding genes had the highest proportion of CNV sequence, higher than the exons of protein-coding genes (makes sense to me since they have less impact and are then not selected against)

## 8. The authors generated a null CNV map and found genes for which at least 85% of the exons were homozygous deleted. What are the functions of these genes? And why did the authors say that they seem to be non-essential? (Homozygous deleted genes)
They would seem non-essential, as they could be missing from the genomes of the apparently healthy individuals. They do, however, have more gene family members, which is more common among duplicated genes <- may be redundant or related to late-onset phenotypic effects which do not substantially reduce fitness

## 9. If you are a medical doctor, how do you use this map a s a tool to assess the clinical importance of a CNV? (Clinical application of the CNV map part in Discussion)
Can be used to assess the clinical importance of a CNV found in a case subject based on: i) whether it is found among the CNVRs of the CNV map and ii) whether it overlaps with medically relevant genes CNV found in patient that overlaps with any of these genes while not being found in the CNV map wouldsuggest medical importance.

