# Sequence alignment Homework 
## Compare the HBA1, HBA2 and HBB gene on DNA and protein level
### Homo sapiens - DNA level: 
* HBA1 vs HBA2 (EMBOSS Stretch)
Aligned_sequences: 2
 1: JQ423459.1
 2: GU145033.1
 Matrix: EDNAFULL
 Gap_penalty: 16
 Extend_penalty: 4

 Length: 895
 Identity:     776/895 (86.7%)
 Similarity:   776/895 (86.7%)
 Gaps:          97/895 (10.8%)
 Score: 3356
The gaps are located for the most part at the start and end of the sequence alignment, the rest of the sequence is mostly the same , so the differneces are mainly found in the initial and final areas that could also be UTR. 

Using mRNA:
 Aligned_sequences: 2
 1: NM_000558.5
 2: NM_000517.6
 Matrix: EDNAFULL
 Gap_penalty: 16
 Extend_penalty: 4

 Length: 577
 Identity:     557/577 (96.5%)
 Similarity:   557/577 (96.5%)
 Gaps:           1/577 ( 0.2%)
 Score: 2693
This seems to confirm that the difference in the UTR. 

* HBA1 vs HBB 
Aligned_sequences: 2
 1: JQ423459.1
 2: CR536530.1
 Matrix: EDNAFULL
 Gap_penalty: 16
 Extend_penalty: 4

 Length: 832
 Identity:     304/832 (36.5%)
 Similarity:   304/832 (36.5%)
 Gaps:         391/832 (47.0%)
 Score: -928
The gaps are sparse around the entire sequence and the identity is considerably reduced compared to HBA1 vs HBA2. 

With mRNA: 
 Aligned_sequences: 2
 1: NM_000558.5
 2: NM_000518.5
 Matrix: EDNAFULL
 Gap_penalty: 16
 Extend_penalty: 4

 Length: 641
 Identity:     353/641 (55.1%)
 Similarity:   353/641 (55.1%)
 Gaps:          77/641 (12.0%)
 Score: 361
The gaps are sparse around the entire sequence and the identity is considerably reduced compared to HBA1 vs HBA2. 

* HBA2 vs HBB 
Aligned_sequences: 2
 1: GU145033.1
 2: CR536530.1
 Matrix: EDNAFULL
 Gap_penalty: 16
 Extend_penalty: 4

 Length: 864
 Identity:     300/864 (34.7%)
 Similarity:   300/864 (34.7%)
 Gaps:         420/864 (48.6%)
 Score: -1056

With mRNA: 
 Aligned_sequences: 2
 1: NM_000517.6
 2: NM_000518.5
 Matrix: EDNAFULL
 Gap_penalty: 16
 Extend_penalty: 4

 Length: 638
 Identity:     347/638 (54.4%)
 Similarity:   347/638 (54.4%)
 Gaps:          72/638 (11.3%)
 Score: 343
As for HBB vs HBA1 the gaps are present over the entire sequence. 

### Homo sapiens - Protein level 
* HBA1 vs HBA2 
Aligned_sequences: 2
 1: NP_000549.1
 2: NP_000508.1
 Matrix: EBLOSUM62
 Gap_penalty: 12
 Extend_penalty: 2

 Length: 142
 Identity:     142/142 (100.0%)
 Similarity:   142/142 (100.0%)
 Gaps:           0/142 ( 0.0%)
 Score: 733
They are the same protein. 

* HBA1/2 vs HBB
Aligned_sequences: 2
 1: NP_000549.1
 2: NP_000509.1
 Matrix: EBLOSUM62
 Gap_penalty: 12
 Extend_penalty: 2

 Length: 149
 Identity:      65/149 (43.6%)
 Similarity:    90/149 (60.4%)
 Gaps:           9/149 ( 6.0%)
 Score: 277
HBB and HBA1/2 at the DNA level showed differences, with around 55% identity, but for the protein there is an identity at 43.6% and  also a considerable similarity at 60.4%. This goes to show that even if the DNA presents differences, the proteins are more conserved. 

### Mus musculus - DNA level
* Hba-a1 vs Hba-a2
Aligned_sequences: 2
 1: BC043020.1
 2: NM_001083955.1
 Matrix: EDNAFULL
 Gap_penalty: 16
 Extend_penalty: 4

 Length: 587
 Identity:     562/587 (95.7%)
 Similarity:   562/587 (95.7%)
 Gaps:          18/587 ( 3.1%)
 Score: 2686
In the mouse these 2 genes are very similar, like in the human. 

* Hba-a1 vs Hbb-b1
Aligned_sequences: 2
 1: BC043020.1
 2: NM_001278161.1
 Matrix: EDNAFULL
 Gap_penalty: 16
 Extend_penalty: 4

 Length: 640
 Identity:     341/640 (53.3%)
 Similarity:   341/640 (53.3%)
 Gaps:          81/640 (12.7%)
 Score: 257
Similarly to the human situation, also here Hba-a1 vs Hbb-b1 shows around 55% identity, with gaps spread around the entire sequence. 

* Hba-a2 vs Hbb-b1
Aligned_sequences: 2
 1: NM_001083955.1
 2: NM_001278161.1
 Matrix: EDNAFULL
 Gap_penalty: 16
 Extend_penalty: 4

 Length: 642
 Identity:     348/642 (54.2%)
 Similarity:   348/642 (54.2%)
 Gaps:          67/642 (10.4%)
 Score: 336
Hba-a2 vs Hbb-b1 shows arounf 55% identity and gaps over the sequence alignment. 

### Mus musculus - Protein level
* Hba-a1 vs Hba-a2
Aligned_sequences: 2
 1: NP_032244.2
 2: NP_001077424.1
 Matrix: EBLOSUM62
 Gap_penalty: 12
 Extend_penalty: 2

 Length: 142
 Identity:     142/142 (100.0%)
 Similarity:   142/142 (100.0%)
 Gaps:           0/142 ( 0.0%)
 Score: 739
Like in the human, Hba-a1 and Hba-a2 show a complete conservation of the protein, starting from a very similar DNA. 

* Hba-a1 vs Hbb-b1
Aligned_sequences: 2
 1: NP_032244.2
 2: NP_001265090.1
 Matrix: EBLOSUM62
 Gap_penalty: 12
 Extend_penalty: 2

 Length: 149
 Identity:      63/149 (42.3%)
 Similarity:    86/149 (57.7%)
 Gaps:           9/149 ( 6.0%)
 Score: 275
The Hbb-b1 protein is more conserved compared to the DNA sequence if compared to Hba-a1/2. At the DNA level there was around 55% identity, whereas at protein level 42.3% identity and 57.7% similarity. 

In conclusion, both in the human and the mice, HBA1 and HBA2 share high similarity at the DNA level, and code for the same protein, whereas HBA1 and HBB show limited similarity at DNA level and a better conservation at a protien level. This suggests that the duplication of HBA1 and HBA2 is more recent compared to the duplication of HBA and HBB, allowing for more changes to occur, and it seems a common event across human and mice species. 