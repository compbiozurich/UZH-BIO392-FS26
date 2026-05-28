Paper notes:

## FISH (1992 review paper and others):
- FISH widely used to detect already known chromosomal abnormalities
- inability of regular FISH to differentiate each human chromosome with a different colour (compared to methods such as the more laborous karyotype analysis)
- new improvements on the method may pave the path towards redefinition of cytogenic analysis
- multi-colour FISH allows differentiation of different sequences - 'combinatorial labeling' allows eg 3 fluorochromes in predetermined ratio, with 2^N-1 possible combinations of discernible sequences, where N is the number of fluorochromes
- epifluorescence filter and computational tools allow for finer distinction between fluorochromes, increasing the amount of fluorochromes that can be practically used in an experiment
- cytogenic analysis with multiplex FISH:
    - pool of labeled human chromosomal probes, each with a different fluorochromal combination
    - metaphase chromosomes to hybridize with
    - capture separate image for each fluorophore using filter wheel
    - achieve >90% discrimination from spectral neighbour fluorochromes
- distinguishing between spectrally overlapping probes with Fourier transformation, CCD-imaging, and optical microscopy - SKY
    - triple pass filter allowing all probes to be imaged at the same time without image shift
    - computer spectral-based algorithm assigns pseudo-colors to the detected probes
- uses of M-fish:
    - detected chromosomal number abnormalities
    - some (but not all) structural rearrangemenets - translocations and large deletions for example
    - can help detect new abnormalities in cancer cells that are more difficult to detect with other conventional strategies (most predominantly in leukaemias and lymphomas)
    - examining phylogeny and chromosomal structural domains and interrelationships in metaphase nucleus - examine chromosomal evolution and degrees of homology across species; might be particularly useful in plants and agriculture
    - routinely used in certain cancer testing - chronic myoloid leukaemia, multiple myelomas, melanoma (Fluorescence in situ hybridization (FISH): types and application: a review Article Informations, 2023)
    - "The diseases that have been diagnosed using FISH include Prader-Willi syndrome, Angelman syndrome, 22q13 deletion syndrome, chronic myelogenous leukemia, acute lymphoblastic leukemia, Cri-du-Chat syndrome, velocardiofacial syndrome, and Down syndrome. The analysis of chromosomes 21, X, and Y can identify oligozoospermic individuals at risk." - Fluorescence In Situ Hybridization (FISH) and Its Applications (2017)
- limitations (as of 1992 paper)
    - primarily insertions (paracentric and pericentric) and small mutations (insertions, duplications, deletions)
    - translation across laboratories and into industry may be challanging - difficult to predict; no major impact in clinical diagnostics of cytogenetics
    - can be costly and require high upfront costs (estimated $150'000 for all needed equipment and base reagents to get started)
    - lack of developed criteria for acceptible performance or regulations
    - even for detected abnormalities, more specific further probes are likely to be needed for full diagnosis

## SKY (Multicolor Spectral Karyotyping of Human Chromosomes) (1996)
- measure one spectrum through triple pass filter instead of an individual one for each fluorochrome

## CGH (Comparative Genomic Hybridization) for the analysis of leukaemias and lymphomas
-presence of BCR-ABL fusion in almost all cases of CML - serving as diagnostic criterion to distinguish from myeloproliferative disorders
- t(11;14)(q13;q32) - characteristic for mantle cell lymphoma
- most publish studies focus on specific abberations in different tumor types, but not so much on their value in predicting the disease or outcome of treatment
- cytogenic data can be used to stratify patients into different risk groups
- two major limitations of FISH in cytogenetics: 1. target region relatively small (30kbp-1Mbp) - need preknowledge of specific target chromosomal subregion or gene; 2. Only a limited number of chromosomal regions can be investigated - mapping only a small part of the whole cancer genome
- CGF offers analysis of chromosomal gains and losses without need for preknowledge of affected chromosomes
- basic CGF principle: combination of FISH with quantitative digital image analysis; whole genomic DNA with unkwnown genomic content derived from tumor tissue is differentially labeled and hybridized to well-defined human metaphase spread ("reverse painting" - a reversed approach compared to FISH) - normal metaphase chromosomes are almost homogenously stained, with over- (or under-) represented regions differing in stain intensity; hybridization of differentially labeled normal genomic DNA serves as internal control; comparison of intensities between tumour hybrid and control allows detection of chromosomal imbalances with the aid of dedicated image analysis software
- future progress: using microarray technology ("DNA chips") - arrays containing many samples associated with given malignancy can be used to probe patient tumor DNA in a single reaction to test for existance of given abberations; the process can potentially be automated

## A complete, telomere-to-telomere human genome sequence presents new opportunities for evolutionary genomics (https://doi.org/10.1038/s41592-022-01512-4)
- greatest challenge in filling gaps in first human genome projects: highly repetitive regions (unsolvable with short-read technology) - and account for about 6-8% of the GRCh38 reference human genome
- Telomere-to-Telomere consortium build with help of long-read sequencing technologies and computational algorithms to fill in the gaps in the genome
- nearly 100 protein-coding genes newly discovered after release of T2T-CHM13 genome
- increases number of variants discovered and accurate detection
- help fill in the gaps in genomic evolution (though T2T genome pipeline at the time not yet available for all non-human species)
- also easier detection of duplicated genes which are otherwise similar in sequence and collapsed in contemporary genome assembly strategies
- potentially help decode the sex-specific chromosomes (Y and W)
- challenges: limitation of species the pipeline can be applied to; it remains difficult to produce a haplotype-resolved diploid genome at the T2T level; comprehensive and accurate annotations are crucial do be addressed when shifting from other genome annotations (liftover), but not possible for newly sequenced and highly variable regions - de novo annotation of the T2T-CHM13 genome assembly needed; alignment (especially of highly repetitive regions) though achiavable, requires intense computational resources, and comparison between alignments of highly repetitive regions and variation therein still lack adequate tools; given costs of T2T genome assembly, currently impossible to produce a full genome for every species\

*to be continued*
