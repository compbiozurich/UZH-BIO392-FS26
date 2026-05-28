# Hemoglobin Gene Similarity Analysis
I completed this exercise using EMBOSS Stretcher (Matrix: DNA: DNAfull (EDNAFULL), Protein: EBLOSUM62). I retrieved the sequences from: www.ncbi.nlm.nih.gov. Chose this because EMBOSS Stretcher is a global aligner (Needleman-Wunsch based), appropriate for comparing full-length homologous sequences of similar length.

## HUMAN (homo sapiens):
### DNA (nucleotides) 
#### 1. Hba1 vs Hba2: Length = 577, Identitiy = 577/577 (96.5%), Similarity = 577/577 (96.5%), Gaps = 1/577 (0.2%), Score = 2693 
These are so similar (seen by the high score value) because their gene duplication event happened quite recently. This means not enough time has passed for mutations to accululate and diverge the sequences significantly. (Using blast.ncbi.nlm.nih.gov I found that the E value was 0.0, and the % identity was 96.53%. For the next comparisons (Hbas vs Hbb) it said that the DNA doesn't align well.) 
 Aligned_sequences: 2
 1: NM_000558.5
 2: NM_000517.6
 Matrix: EDNAFULL
 Gap_penalty: 16
 Extend_penalty: 4

#### 2. Hba1 vs Hbb: Length= 641, Identity= 353/641 (55.1%), Similarity = 353/641 (55.1%), Gaps = 77/641 (12.0%), Score = 361. These sequences (of paralogs) differ significantly more because the gene duplication event (HBA and HBB) occured a long time ago (~500 million years ago). 
 Aligned_sequences: 2
 1: NM_000518.5
 2: NM_000558.5
 Matrix: EDNAFULL
 Gap_penalty: 16
 Extend_penalty: 4

#### 3. Hba2 vs Hbb: Length= 638, Identity= 347/638 (54.4%), Similarity= 347/638 (54.4%), Gaps= 72/638 (11.3%), score = 343. 
Comparing point 2 and 3 also shows that Hba1 and Hba2 aren't 100% identical at DNA level (like point 1 already illustrates). 
 Aligned_sequences: 2
 1: NM_000517.6
 2: NM_000518.5
 Matrix: EDNAFULL
 Gap_penalty: 16
 Extend_penalty: 4


### Protein: 

#### 1. Hba1 vs Hba2: Length = 142, Identity= 142 (100%), Similarity = 142 (100%), Gaps = 0/142 (0.0%), Score = 733. THis shows that while there are differences on the DNA level, there are no differences at the level of protein. (Both genes express the same protein.) (Found with blast.ncbi.nlm.nih.gov: Total Cluster Score = 286, Query Cover representative sequence = 100%, E value = 2e-106, Percentage Identity = 100.0%, Length = 142)
 Aligned_sequences: 2
 1: NP_000549.1
 2: NP_000508.1
 Matrix: EBLOSUM62
 Gap_penalty: 12
 Extend_penalty: 2

#### 2. Hba1 vs Hbb: Length = 149, Identity = 65/149 (43.6%), Similarity = 90/149 (60.4%), Gaps = 9/149 (6.0%), Score = 277. Note for myself: Similarity (relevant at protein level) means that the position is functionally similar, though maybe not identical. Found with blast.ncbi.nlm.nih.gov: Total cluster score = 114, Query Cover representative sequence = 98%, E value = 2e-38, Percentage Identity = 43.45%, Length = 147. 
 Aligned_sequences: 2
 1: NP_000549.1
 2: NP_000509.1
 Matrix: EBLOSUM62
 Gap_penalty: 12
 Extend_penalty: 2

#### 3. Hba2 vs Hbb: Length = 149, Identity = 65/149 (43.6%), Similarity = 90/149 (60.4%), Gaps = 9/149 (6.0%), Score = 277. Makes sense that it's the same as above because Hba1 & Hba2 = 100% identical at the level of protein. Found with blast.ncbi.nlm.nih.gov: Total cluster score = 114, Query Cover representative sequence = 98%, E value = 2e-38, Percentage Identity = 43.45%, Length = 147.
 Aligned_sequences: 2
 1: NP_000508.1
 2: NP_000509.1
 Matrix: EBLOSUM62
 Gap_penalty: 12
 Extend_penalty: 2



## MOUSE: I compared 2 genes (Hba and Hbb). 
### DNA
#### 1. Hba vs Hbb: Length = 643, Identity = 350/643 (54.4%), Similarity = 350/643 (54.4%), Gaps = 87/643 (13.5%), Score = 314 
Aligned_sequences: 2
 1: NM_008218.2
 2: NM_001278161.1
 Matrix: EDNAFULL
 Gap_penalty: 16
 Extend_penalty: 4

### Protein: 
#### 1. Length = 149, Identity = 63/149 (42.3%), Similarity = 86/149 (57.7%), Gaps = 9/149 (6.0%), Score = 275. Found with blast.ncbi.nlm.nih.gov: Total cluster score = 111, Query Cover representative sequence = 97%, E value = 5e-37, Percentage Identity = 42.07%, Length = 142.
 Aligned_sequences: 2
 1: NP_032244.2
 2: NP_001265090.1
 Matrix: EBLOSUM62
 Gap_penalty: 12
 Extend_penalty: 2



## EXTRA: COMPARISON ACROSS SPECIES 
### DNA 
#### 1. Hba1 (human) vs Hba (Mouse)
 Length: 589
 Identity:     447/589 (75.9%)
 Similarity:   447/589 (75.9%)
 Gaps:          32/589 ( 5.4%)
 Score: 1583

#### 2. Hbb (human) vs Hbb (Mouse)
 Length: 634
 Identity:     495/634 (78.1%)
 Similarity:   495/634 (78.1%)
 Gaps:          10/634 ( 1.6%)
 Score: 1823


### Protein
#### 1. Hba1 (human) vs Hba (Mouse)
 Length: 142
 Identity:     123/142 (86.6%)
 Similarity:   131/142 (92.3%)
 Gaps:           0/142 ( 0.0%)
 Score: 653

#### 2. Hbb (human) vs Hbb (Mouse)
 Length: 147
 Identity:     118/147 (80.3%)
 Similarity:   132/147 (89.8%)
 Gaps:           0/147 ( 0.0%)
 Score: 638

Interesting to note that orthologs show higher identity (75-86%) than the ancient HBA/HBB paralog split (43-55%). This reflects that human and mouse diverged only 90 million years ago, whereas the HBA/HBB gene duplication occurred 500 million years ago, giving paralogs much more time to accumulate mutations.


exercise: MSA (hba orthologs) 
Mouse: >10090.ENSMUSP00000020531
MSLMKNERAIIMSMWEKMAAQAEPIGTETLERLFCSYPQTKTYFPHFDLHHGSQQLRAHGFKIMTAVGDAVKSIDNLSSALTKLSELHAYILRVDPVNFKLLSHCLLVTMAARFPADFTPEVHEAWDKFMSILSSILTEKYR

dog: >9615.ENSCAFP00000059041
MSLTKAERTIILSMWGKISTQADAIGTEALERLFASFPQTKTYFPHFELRAGSAHLRAHGAKVVAALGDAVRSLDDVAGALSRLSELHAYILRVDPVNFKVGGGGGPQGPQGPQAPPALTQALPPAQLLSHCLLVTLASHFPADLTADAHAAWDKFLSLVSCVLTEKYR

chicken: >9031.ENSGALP00000012046
MALTQAEKAAVTTIWAKVATQIESIGLESLERLFASYPQTKTYFPHFDVSQGSVQLRGHGSKVLNAIGEAVKNIDDIRGALAKLSELHAYILRVDPVNFKLLSHCILCSVAARYPSDFTPEVHAAWDKFLSSISSVLTEKYR

zebrafish: >7955.ENSDARP00000066382
MSLSAKDKAAVRGFWAKIAPKGEQIGNEAFSRLLLVYPQTKTYFSHWNDLAPGSPSVKKQGKKIVGGLGLAVDKIDDLFNGLLNLSELHAFQLRVDPANFKLLSHCLLVVFAMLFPDDFTAEVHLAIDKFLARVALALSDKYR

salmon: >8030.ENSSSAP00000024115
QVNQRSKMSLTARDKSVVNAFWGKIKGKADVVGAEALGRMLTAYPQTKTYFSHWADLSPGSAPVKKHGAVIMGAIGNAVGLMDNLVGGLSALSDLHAFKLRVDPGNFKILSHNILVTLAIHFPADFTPEVHIAVDKFLAALSAALADKYR

