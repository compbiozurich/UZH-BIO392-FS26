# Exploring Genome Resources
## USCS Genome Browser 
* there are genomes from multiple species 
* good for visualization 
* BED files 

## NCBI 
* reference data 
* different version of mappings 

## Ensembl 
* various data about the genome 
    - assemblies
    - annotations 
    - variations 

In general: NCBI for starting reference data, USCS for visualization and Ensembl for variants and annotations. 

### Variant Databases 
* repositories (dbSNP, dbVAR, EVA): store raw variant data without interpretation 
* ClinVar has raw data associated with diseases, there is a classification


### Interpretation resources
* ClinGen, COSMIC, VICC
* VICC harmonization work showed that cancer databases disagreed for some variants 
    - can look up in MetaKB a gene and it gives you results in various websites that store gene information for cancer 
* These tools apply methods and classifications to assign clinical meaning to the variants found in the variant databases 

# Disease classification
* ICD-10 
    - global standard for mortality statists, epidemiology 
    - hierarchical alphanumerical codes --> longitudianl data 
* ICD-O
    - ICD for concology 
    - 2 codes: one for Topography, one for Morphology 
    - cancer registries worldwide 
* NCIt
    - cancer research database 
    - ontology based 
    - useful for computable reasoning 

# TNM codes 
* T: primary tumor size 
    - X: not assessed
    - 0: no primary tumor
    - 1-4: incrasing size 
    - is: in situ 
* N: lymph nodes spread
    - X, O 
    - 1-3
* M: metastasis spread
    - 0: no distant metastasis 
    - 1: distant metastasis is present 


