## Questions to the Paper "A copy number variation map of the human genome"

### 1. Why is it important to construct a CNV map of healthy individuals of various ethnicities?

A CNV map of healthy individuals of different ethnicities provides a baseline normal genetic variation. It allows us to see which CNVs are benign and not clinically relevant. It needs to be based on different ethnicities to capture population based genome variation.

### 2. What is the CNV size that the authors defined?

The authors used 50bp-3Mb as the size of CNVs. However, it is clear that the size definition is under debate and that other studies sometimes define it differently.

### 3. What are the primary approaches used for CNV detection? And what are the advantages and limitations of these technologies?

- **Sequencing based methods:** Mostly NGS and Sanger based methods.They are more sensitive and are able to detect small variants and yield accurate sequence level breakpoint resolution. However, they underrepresent duplications.
- **Array based methods:** They are better at detecting duplications, but have limited resolution and are worse at detecting small variants.
- **Other methods:** e.g. FISH, PCR, MLPA, optical mapping. They are not considered in this study because they had low sensitivity and resolution.

### 4. The authors used a clustering method to combine data from different studies into merged CNVRs (Copey number variable regions). What are the 2 different criteria for cluster filtering? And why did they do this filtering?

The CNV clusters were filtered by the number of subjects that carried the CNV and the number of studies that reported the CNV. This was done to remove false positives and rare singletons and improve reproducibility and reliability by removing study-specific artifacts.

### 5. What are the thresholds in stringency level 1, inclusive map (stringency level 2), and stringent map (stringency level 12), respectively?

- Level 1: At least 1 subject and 1 study (this also includes rare singletons) 
- Inclusive map (Level 2): At least 2 subjects and 1 study 
- Stringent map (Level 12): At least 2 subjects and 2 studies 

### 6. Which percentage of the genome contributes to CNV in inclusive map and stringent map respectively?

- Inclusive map: covered ca. 9.5% of the genome
- Stringent map: covered ca. 4.8% of the genome

### 7. By your intuition, which kind of genes are more variable between protein-coding genes and non-coding genes? How about their findings in this paper?

By my intuition, non-coding genes should be significantly more variable compared to protein-coding genes, as mutations in these genes are under less negative selection. This was confirmed in the paper: they stated that exons of non-coding genes had the highest proportion of CNVs and were more variable than the exons of protein-coding genes.

### 8. The authors generated a null CNV map and found genes for which at least 85% of the exons were homozygously deleted. What are the functions of these genes? And why did the authors say that they seem to be non-essential? 

This number comes from the inclusive map, where they found 107 protein-coding genes for which at least 85% of the exons were deleted in the null CNVRs. Because they can be missing in the genome of healthy individuals, the authors claim that they seem non-essential. The affected genes had more gene family members, which is common in duplicated genes and might indicate redundant functions (14 of those genes had paralogs). They might also cause late-onset phenotypes which don't significantly decrease fitness. They highlighted genes involved in the immune response(KIR3DL1, HLA-DRB1, HLA-DQA1), metabolism (UGT2B17) and placental and fetal wellbeing (PSG1).

### 9. If you are a medical doctor, how do you use this map as a tool to assess the clinical importance of a CNV? 

I would compare the CNVs of the patient with this map. If the variation shows up on the map, it is likely benign and not clinically relevant. If it doesn't show up, then that might indicate pathogenicity. However, it is important to keep in mind that the map is based on "only" 2647 individuals, and there will certainly be other/more rare benign CNVs that are not included in the map, so just because the CNV isn't on the map, that doesn't necessarily indicate that it is pathogenic.