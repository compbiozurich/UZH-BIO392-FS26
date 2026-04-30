Task: Reading up on Genome Technologies: 
 1.	General NGS technologies
 a.	Intensity based: most common, detection is based on fluorescent loight intensity, each nucleotide carries a fluorescent dye. Detection; the light emitted, the laser excites the dye which therefore emits light of a specific color/intensity, camera measures the intensity of that light and the color revelas which base (ATCG). 
 b.	Count based: not detect light, but the release of a H+ atom when nucleotide is incorporated into DNA (byproduct) -> causes small change in pH. This change is detected by semiconductor sensor. 
 2.	Long read vs short read technologies
 a.	Short read: 150-300 bp. Illumina or Ion Torrent
 i.	Advantage: very high accuracy per base, very high throughput, cheap, good for detecting SNPs, small indels, CNVs
 ii.	Disadvantages: short reads cannot span repetitive regions, cannot resolve structural variants that are larger than the read length, struggles with highly complex regions (centromers, telomers, segmental duplications). 
 b.	Long read: 10-100k+ bp. Oxford nanopore
 i.	Adv: can span repetitive regions, can detect structural variants directly, can sequence entire genes in one read, enabled the T2T entire genome, can do direct epigenetic detection 
 ii.	Disadvantages: high error rate per base, more expensive, less throughput, larger/more complex data files
3.	Banding analysis: The original cytogenetic technique. Chromosomes are stained with Giemsa dye, produces a characteristic pattern of dark and light bands on each chromosome. (grow cells in culture and arrest them in metaphase, then treat chromosomes with trypsin). First technique for chromosomal analysis, still clinical today: routine karyotyping in prenatal diagnosis.
 4.	SKY: uses spectral imaging system that measures the exact spectrum of light from each chromosome; assigns it a pseudocolor. Still used today, primarily in research. 
 5.	Chromosomal CGH: Competitive hybridization of tumor DNA (green) vs normal DNA (red) onto normal metaphase chromosomes. Green/red ratio reveals DNA gains and losses across the whole genome. Widely used 1990-2000 as cancer research tool, now more or less replaced by array CGH (gives much better resolution). 
 6.	Array CGH: ame competitive hybridization principle as chromosomal CGH, but hybridized onto a microarray chip with thousands of known probes instead of onto chromosomes. Standard test for detecting CNVs in patients with developmental delay, intellectual disability etc. Research: cancer CNV profiling. 
 7.	T2T genome: (Telomere to Telomere, 2022): first complete human reference genome (the editions before that had missing bp). The around 8% of the genome that was still missing mainly consisted of centromeres, telomeres, and short arms of acrocentric chromosomes: short reads couldn’t sequence this. 
 a.	Technologies that enabled this: PacBio HiFi Long reads, Oxford Nanopore ultra-long reads, specialized cell line, advanced assembly algorithms. 
 8.	Graph genomes: Instead of one kinear sequence, a graph genome represents the genome as a network of nodes and edges. Example is the human Pangenome Reference (graoh genome built from 47 diverse human genomes, phased diploid assemblies). 
