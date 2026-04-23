# Homework Day 4 (Afternoon)


Genomic DNA sequences for human and mouse globin genes were obtained from the NCBI Gene database by searching for the corresponding Gene IDs. 

Humans: 
- *HBA1* (3039)
- *HBA2* (3040)
- *HBB* (3043) 

Mouse:
- *Hba-a1* (15122)
- *Hba-a2* (110257)
- *Hbb-b1* (15129) 

Pairwise DNA sequence alignments were performed using EMBOSS Stretcher. For all comparisons, the EDNAFULL substitution matrix was applied with a gap opening penalty of 16 and a gap extension penalty of 4. In humans, alignment of *HBA1* and *HBA2* resulted in a sequence length of 843 bp with 96.6% identity (814/843) and only 0.9% gaps, indicating very high similarity. In contrast, *HBA1* vs. *HBB* showed a much lower identity of 32.3% (524/1623) with 49.0% gaps, and *HBA2* vs. *HBB* yielded 31.7% identity (514/1620) with 49.2% gaps.

The same analysis was conducted for mouse genes. The alignment between *Hba-a1* and *Hba-a2* produced 98.7% identity (811/822) with minimal gaps (1.2%), again demonstrating strong conservation. Comparisons between α- and β-globin genes showed substantially lower similarity: *Hba-a1* vs. *Hbb-b1* had 53.3% identity (341/640) with 12.7% gaps, and *Hba-a2* vs. *Hbb-b1* had 54.2% identity (348/642) with 10.4% gaps.

Protein sequences were retrieved from the UniProt using accession numbers:

Human:
- P69905 (human α-globin) 
- P68871 (human β-globin)

Mouse: 
- P01942 (mouse α-globin)
- P02088 (mouse β-globin). 

Protein alignments were again carried out using EMBOSS Stretcher, this time with the EBLOSUM62 matrix, a gap opening penalty of 12, and an extension penalty of 2.

Human *HBA1* and *HBA2* encode identical protein sequences and therefore show complete similarity. However, comparison of human α- and β-globin proteins resulted in 43.6% identity (65/149) and 60.4% similarity, with 6.0% gaps. In mouse, *Hba-a1* and *Hba-a2* also encode identical proteins, while alignment of α- and β-globin proteins showed 42.3% identity (63/149), 57.0% similarity, and 6.0% gaps.

Overall, it seems that α-globin genes are highly conserved within each species, whereas α- and β-globin genes show substantial divergence at the DNA level but retain moderate similarity at the protein level. This pattern is consistent across both human and mouse datasets.
