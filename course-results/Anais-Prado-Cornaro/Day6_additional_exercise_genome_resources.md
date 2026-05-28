# Genome Resources & their primary use

## 2 Types of Resources

### Primary Deposition Databases
Databases where original, raw data can be deposited. (e.g. European Nucleotide Archive) 

| Database | Stored information / Use Case |
|----------|-------------|
| NCBI's SRA (Sequence Read Archive) | Stores raw (minimally processed), highthroughput sequencing data. Used primarily for archiving & sharing NGS reads. |
| EMBL-EBI's ENA (European Nucleotide Archive) | Stores raw nucleotide sequences, sequence assembly and fucntional annotations (additional information such as experimental procedures and other related metadata). |
|  NCBI's dbSNP | Archive for human genetic variations, mainly focusing on SNP's. |
| NCBI's dbVAR | Archive for structural variants, from all species. It also stores clincal information. |
| NCBI's ClinVar | Variant–disease submissions. Used to research the clinical significance of a variant. |
---

### Interpreted Databases 
Databases providing agglomerated & curated data derived from primary databases. They can add biological or clinical context.

(e.g. Variant Annotations, UniprotKB)

| Database | Stored information / Use Case | 
|----------|-------------|
| ClinVar (curated) | Clinical significance of variants, Pathogenicity classifications |
| Progenetix | Stores curated data on human CNVs/CNAs that are associtaed with all types of human cancer types. |
| gnomAD (Genome Aggregation Data Base) | Aggregation of Genome and Exome sequences and additional summaries & analyses. |
| Ensembl VEP | Predicts variant effects of gene transcripts, protein sequences.|

---

## Notes on Wagner et al. VICC paper (2020)

- Authors of the paper see a problem in: "six prominent somatic cancer variant knowledgebases were highly disparate in content, structure and supporting primary literature, impeding consensus when evaluating variants and their relevance in a clinical setting."
- The paper aggregates variant interpretations from multiple knowledgebases (CIViC, OncoKB, JAX-CKB, CGI, MolecularMatch)
- It introduces a harmonized data model for somatic variant clinical evidence
- This could be useful for understanding the landscape of interpreted cancer variant resources


