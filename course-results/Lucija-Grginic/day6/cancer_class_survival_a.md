## Cancer Classifications 

### Different classification systems

**ICD-10**
- It is the 10th revision of the International Classification of Diseases (ICD), a medical classification list by the World Health Organization (WHO). <br>
It contains codes for diseases, signs and symptoms, abnormal findings, complaints, social circumstances, and external causes of injury or diseases
- **Uses**: documenting diagnoses in patient health records, identifying patient cohorts in clinical studies, tracking disease prevalence and incidence nationally and globally, billing and insurance reimbursement.
- **Advantages**: with ~70000 codes high specificity in disease documentation can be achieved, thereby reducing ambiguity and increasing data quality. Used in 100+ countries, so it enabled international health data comparability and interoperability.
- **Problems**: the high number of codes increases complexity that needs to be understood by doctors and scientists. To introduce this system huge investments need to be made due to high upfront costs. Despite its size, some emerging conditions, mental health nuances, and rare diseases are still inadequately represented across some countries. Incorrect or overly general codes can lead to claim denials and compliance risks. 


**ICD-0**
- It is a specialized version of ICD designed specifically for cancer registries and oncology.
- Requires 2 codes per cancer: one for morphology/histology one for topography/location of the cancer
- **Uses**: standardization of cancer classification, epidemiology, cancer registries and pathology reports.<br>
- **Advantages**: 2 code flexibility leads to higher accuracy in cancer classification. Standardizes cancer data across countries and registries worldwide. It is longitudinal tracking — enables consistent cancer surveillance over decades<br>
- **Problems**: limited clinical use because there are more general databases like SNOMED-CT and ICD10 (even ICD11 now). No true hierarchical order. Many entities difficult to remap if using only single code. ICD-O is purely a registry/research tool; it cannot be used for insurance claims or reimbursement. New tumor types and reclassifications in pathology can take years to be incorporated into official revisions.


**NCIt**
- Neoplasm Classifications in the NCI Thesaurus: NCI's core reference terminology and biomedical ontology are collected in the NCIt
- it provides individual codes for site-specific occurrences of "biological" diagnoses (1 code per cancer)<br>
- **Uses**: Provides terminology in clinical trial protocols and submissions Standardizes adverse event reporting. Enables cross-database querying and data integration, especially in cancer registries. Annotating genomic, proteomic, and clinical datasets.
- **Advantages**: Truly hierarchical system ontology. Empowers "logical OR" queries. It has a broad scope, covers: genes, drugs, anatomy, and diseases in one unified system. Publicly available, downloadable in multiple formats. Machine-readable structure makes it ideal for computational applications.
- **Disadvantages**: Primarily driven by NCI/FDA priorities; less globally governed than ICD or WHO systems. Some concepts are represented at multiple levels of granularity, causing ambiguity in annotation. The ontological structure is difficult to navigate without specialized training or tooling.



## TNM codes

T- primary Tumor size and extant

N- number of nearby lymph Nodes with tumor infiltration

M - whether there are Metastases

*not used in leukemias/lymphomas

Example:<br>
T3N2M1: late stage of invasive tumor(>5cm) with few ipsilateral lymph node involved and 1 distant metastasis present.





