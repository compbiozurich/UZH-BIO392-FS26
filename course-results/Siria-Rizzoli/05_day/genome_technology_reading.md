# Genome Liftover
* need tools to convert the genome coordinates between different maps 
* segment_liftover: continuity-preserving remapping 
    * approximate locus conversion 
    * automated batch processing 
* 2 general methods: 
    1. re-align original sequence data to the target assembly 
        * best result but time-consuming
        * if data not available it is impossible
    2. mapping file 
        * good balance between performance and accuracy 
* current tools: 
    1. liftOver: most comprehensive selection of assemblies for different organisms and can convert between many of them. (web and command line utility)
    2. CrossMap: covert files in BAM/SAM or BigWig format. 
    3. Remap: for each organism comprehensive list of assemblies and can do cross species mapping in limited number of organisms. 
    * these tools are good for coordinate conversions, but face challenges for genome segments not continuous in the target assembly
    * limit of these tools is single input files
* segment_liftover: 
    * uses USCS liftOver to convert file 
    * if not converted: approximate conversion, if this also fails or the quality check is not passed, the output goes to logs 

# Genome Technologies 
## Multicolor Spectral Karyotyping of Human Chromosomes
* diagnostic potential of FISH would be greatly improved by the ability to analyze the entire genome simultaneously 
* spectral imaging: 
    * use multiple-band filters to capture emission spectra of different probes
    * same classification color is assigned to all pixels with the same spectrum (measured by interferometer)
    * in combination with G-banding can confirm the chromosomal aberration origin of the additional material
    * diagnostic applications in clinical and cancer cytogenetics
    * interspecies study of evolutionary divergence by comparative cytogenetics 
## Comparative Genomic Hybridization 
* knowledge of specific chromosomal aberration allows to identify pathologically relevant genes 
    - ABL in CML and ALL (t9;22)(q34;q11): its presence can differentiate CML from other myeloproliferative disorders
    - MYC in Burkitt's lymphoma (t8;14)(q24;q32)
* use cytogenetic data to stratify patients into different risk groups 
* introduction of fluoresence in situ hybridization (FISH) using DNA probes: 
    - detection in metaphase spreads and interphase nuclei 
    - information about the presence of numerical or structural genetic aberrations 
    - BUT: target regions are small, so preknowledge is needed + only limited regions can be investigated in one experiment 
* comparative genetic hybridization (CGH): 
    - comprehensive analysis of chromosomal changes without preknowledge 
    - FISH principles combined with quantitative digital image analysis 
    - whole genomic DNA is hybridized to well-defined human metaphase spreads 
    - Comparing the signal intensities of tumor and (internal) control DNAs allows the detection of chromosomal imbalances 
* workflow: 
    1. prepare slides with high-quality metpahase of normal chromosomes = hybridization matrix 
    2. isolation of genomic DNA from tumor
    3. differential labelling of tumor and control DNA 
    4. simultaneous in situ suppression hybridization of tumor and control DNA
    5. fluorescence detection 
    6. image acquisition and digital image analysis 
    - if the color one sees is the 1:1 mix of control and tumor dye = normal situation
    - ratio > 1 for tumor dye = amplification in tumor
    - ratio < 1 for tumor dye = deletion in tumor 
* today instead of this method arrays are used: 
    - instead of a normal metaphase there is a chip with thousands of small DNA probes to cover entire genome 
    - DNA of tumor and healthy is marked with different fluorophores
    - competitive hybridization 
    - scan and analysis: same readout as before 
    - does not recognize balanced rearrangements
* with array CGH there is higher resolution, it is quicker and more precise (we know position of each probe therefore know position of possible gain or loss)

## T2T
* T2T-CHM13 includes gapless assemblies for all chromosomes except Y
* completed regions include all centromeric sarellite arrays, duplications, short arms for all 5 acrocentric chromosomes
* GRCh38 reference assembly has 151 Mbp of unknown sequence distributed in hte genome 
* long-read shortgun sequencing overcomes the limitations of BAC.based assembly and the challenges of structural polymorphysm between genomes
* PacBio: multi-kb, single-molecule reads solved complex structural variantion and gaps 
* Oxphord Nanopore: > 100-kpb ultralong reads enabled complete assemblies of a human centromere and entire chromosome 
* Problem of long reads technology is high error rate, HiFi for PacBio for 20 kbp reads lowers the error rate: good for differentiate diverged repeat copies or haplotypes  
* T2T-CHM13 adds 5 full chromosome arms and more sequence 
* CHM13 is a complete human haplotype, but doesn't capture the full diversity of human genetic variaiton, Human Pangenome Reference Consortium has joint to build a collection of reference haplotypes from a diverse set of samples 

## Pangenome 
* contains 47 phased, diploid assemblies from a cohort of genetically diverse individuals 
* draft pangenome captures known varaiants and haplotypes and reveals new alleles at structurally complex loci
    - add 119 bp polymorphic sequences 
    - 1,115 gene duplications 
* reduced small variant discovery errors by 34% and increase number of SV per haplotype by 104% 
* aim: capture global genomic diversity across 700 haplotypes of 350 individuals 
    - improve analysis workflow by removing mapping biases that are inherent in hte use of a single linear reference genome 
* improvement in the accuracy of small variants: many regions benefitted but regions with errors in GRCh38 and large L1HS sequences benefitted the most 
* SV genotyping: represent polymorphic SVs is a key advantage of a grpah-based pangenome reference 
    - Although the newly identified SVs were harder to genotype because they are primarily located in repetitive regions, genotype concordances were high and close to the ones for known SV
* improved tandem repeat representations 
    - caribale amond individuals, challenging to access with short reads 
    -  graph approach performed better for 80% of the loci
* improved RNA sequencing mapping 
    - improved correlation 
    - improved expression estimates 
* improved chromatin immunoprecipitation and sequencing analysis 
    - net increase in number of peal calls 
    - recovered epigenomic features specific to SV not present in GRCh38
* 94 de novo haplotype assemblies from a diverse group of 47 individuals
* more than 99% of each assembly, and greater than 90% of the assembled sequence representing highly repetitive arrays, was structurally correct.
    - challenges in CNV and inversions remained 
* Accompanying these assemblies are 94 sets of Ensembl gene annotations, representing a large collection of de novo assembled human transcriptome annotations. 
    - genic CNVs dor 1'115 different protein-coding genes 
    - annotations in health-involved genes
* pangenome: set of individual haploid genomes assemblies and aligment, the combination can be described as a variation graph
    - losslessly stored in compressed, binary represeentation (3-6 GB) representing more than 282 billion bases
    - still problematic how to identify complex SVs 
* SVs
    - short read discovered 7'500-9'500 SVs per sample, long read 25'000
    - PanGenie method allows to discover up to 18'500 SV, so the most part of long-reads SVs are genotyped
* Future: 
    - 6–7 Mb of incorrectly oriented sequence per haplotype
    - base level sequencing errors are still an issue (>12 frameshifts and nonsense mutation per genome annotation probably result from sequencing errors)
    - exoand cohort of 350 individuals via T2T genomes
