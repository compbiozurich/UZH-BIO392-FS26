## Sequence Alignment Exercise

### Human DNA sequence similarity of HBA1, HBA2 and HBB

Genomic sequences were retrieved from NCBI.  

DNA sequences used:  
- **HBA1:** Gene ID 3039  
- **HBA2:** Gene ID 3040  
- **HBB:**  Gene ID 3043  

EMBOSS Stretcher was used as the local alignment tool.  

#### HBA1 vs. HBA2

> Aligned_sequences: 2  
> 1: 176680-177522  
> 2: 172876-173710  
> Matrix: EDNAFULL  
> Gap_penalty: 16  
> Extend_penalty: 4  
>  
> Length: 843  
> Identity:     814/843 (96.6%)  
> Similarity:   814/843 (96.6%)  
> Gaps:           8/843 ( 0.9%)  
> Score: 3930  
  
HBA1 and HBA2 have a very similar sequence. I would assume that they arose from a relatively recent gene duplication event and haven't changed much due to evolutionary pressure to stay similar.

#### HBA1 vs. HBB

> Aligned_sequences: 2  
> 1: 176680-177522  
> 2: c5227071-5225464  
> Matrix: EDNAFULL  
> Gap_penalty: 16  
> Extend_penalty: 4  
>  
> Length: 1623  
> Identity:     524/1623 (32.3%)  
> Similarity:   524/1623 (32.3%)  
> Gaps:         795/1623 (49.0%)  
> Score: -2352  


#### HBA2 vs. HBB

> Aligned_sequences: 2  
> 1: 172876-173710  
> 2: c5227071-5225464  
> Matrix: EDNAFULL  
> Gap_penalty: 16  
> Extend_penalty: 4  
>  
> Length: 1620  
> Identity:     514/1620 (31.7%)  
> Similarity:   514/1620 (31.7%)  
> Gaps:         797/1620 (49.2%)  
> Score: -2406  

In contrast to HBA1 and HBA2, the DNA sequence between HBB and HBA1/2 is significantly more different (32% similarity vs. 97%). As discussed in the lecture, the alpha and beta chain genes in hemoglobin arose from a duplication event of the early globin gene. Because this duplication event happened very long ago, it makes sense that in this time the sequences accumulated mutations and diverged. 

### Human protein sequence similarity of HBA1, HBA2 and HBB

Protein sequences were retrieved from UniProt.  

Protein sequences used:  
- **HBA1/2:** P69905  
- **HBB:** P68871  

EMBOSS Stretcher was used as the local alignment tool. 


#### HBA1 vs. HBA2

HBA1 and HBA2 both produce the same protein (alpha-globin). This makes sense, because their genomic sequence was also very similar.

#### HBA1/2 vs. HBB

> Aligned_sequences: 2  
> 1: HBB  
> 2: HBA1_2  
> Matrix: EBLOSUM62  
> Gap_penalty: 12  
> Extend_penalty: 2  
>  
> Length: 149  
> Identity:      65/149 (43.6%)  
> Similarity:    90/149 (60.4%)  
> Gaps:           9/149 ( 6.0%)  
> Score: 277  

The similarity of the produced protein is higher than that of the DNA sequence (60% vs. 32%). I would assume that the majority of the mutations accumulated in introns or UTRs and that the exons remained more similar because alpha and beta globin need to form a functional complex and can't diverge too much.


### Mouse DNA sequence similarity of Hba-a1, Hba-a2, Hbb-b1

Genomic sequences were retrieved from NCBI.  

DNA sequences used:  
- **Hba-a1:** Gene ID 15122   
- **Hba-a2:** Gene ID 110257   
- **Hbb-b1:**  Gene ID 15129   

EMBOSS Stretcher was used as the local alignment tool. 

#### Hba-a1 vs. Hba-a2

> Aligned_sequences: 2  
> 1: 32233672-32234486  
> 2: 32246492-32247310  
> Matrix: EDNAFULL  
> Gap_penalty: 16  
> Extend_penalty: 4  
>  
> Length: 822  
> Identity:     811/822 (98.7%)  
> Similarity:   811/822 (98.7%)  
> Gaps:          10/822 ( 1.2%)  
> Score: 3987  

Like in humans, the sequence between Hba-a1 and Hba-a2 is very similar in mice.

#### Hba-a1 vs. Hbb-b1

> Aligned_sequences: 2  
> 1: BC043020.1  
> 2: NM_001278161.1  
> Matrix: EDNAFULL  
> Gap_penalty: 16  
> Extend_penalty: 4  
>  
> Length: 640  
> Identity:     341/640 (53.3%)  
> Similarity:   341/640 (53.3%)  
> Gaps:          81/640 (12.7%)  
> Score: 257  

#### Hba-a2 vs Hbb-b1

> Aligned_sequences: 2  
> 1: NM_001083955.1  
> 2: NM_001278161.1  
> Matrix: EDNAFULL  
> Gap_penalty: 16  
> Extend_penalty: 4  
>  
> Length: 642  
> Identity:     348/642 (54.2%)  
> Similarity:   348/642 (54.2%)  
> Gaps:          67/642 (10.4%)  
> Score: 336  

Again, like in humans, the difference between Hba-a1/2 and Hbb-b1 is more different.


### Mouse protein sequence similarity of Hba-a1, Hba-a2 and Hbb-b1

Protein sequences were retrieved from UniProt.  

Protein sequences used:  
- **Hba-a1/2:** P01942  
- **Hbb-b1:** P02088  

EMBOSS Stretcher was used as the local alignment tool. 

#### Hba-a1 vs. Hba-a2

Again, like in humans, Hba-a1 and Hba-a2 encode the same protein.

#### Hba-a1/2 vs. Hbb-b1

> Aligned_sequences: 2  
> 1: HBB1_MOUSE  
> 2: HBA_MOUSE  
> Matrix: EBLOSUM62  
> Gap_penalty: 12  
> Extend_penalty: 2  
>  
> Length: 149  
> Identity:      63/149 (42.3%)  
> Similarity:    85/149 (57.0%)  
> Gaps:           9/149 ( 6.0%)  
> Score: 274  

In mice there is a slightly larger difference between Hba and Hbb than in humans, but the values are comparable. 

### Conclusion
The results for mice and humans were very similar. This makes sense, because the gene duplication event that caused the alpha and beta chain paralogs happened in a common ancestor of humans and mice. In both humans and mice, the genes coding for the alpha subunit are well conserved and the alpha and beta subunits have more divergence.