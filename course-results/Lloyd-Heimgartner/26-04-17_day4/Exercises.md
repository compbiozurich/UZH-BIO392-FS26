

## Exercise 2

### EMBOSS Strecher

- Matrix: EBLOSUM62
- Gap_penalty: 12
- Extend_penalty: 2
     
         
- Identity:      11/14 (78.6%)

- Similarity:    11/14 (78.6%)
- Gaps:           3/14 (21.4%)
- Score: 44

### BLAST

- axin-1 isoform a [Homo sapiens]
- axin-1 isoform b [Homo sapiens]
- Axis inhibition protein 1 [Macaca fascicularis]
- axin-1 isoform X2 [Oryctolagus cuniculus]
- PREDICTED: axin-1 isoform X1 [Chinchilla lanigera]
- axin-1 isoform X1 [Microcebus murinus]
- axin-1 isoform X3 [Macaca nemestrina]
- axin-1 isoform 2 [Mus musculus]
- axin-1 isoform X1 [Vulpes lagopus]
- axin-1 isoform X1 [Saccopteryx bilineata]

Expect (E-value): The number of matches you’d expect to see by chance in a database of that size  
Bit score: A normalized score representing the quality of the alignment (comparable across diﬀerent searches)  
The percent identity is how many positions in the allignements are exact match.  
Alignment length is how many items are involved in the allignemen (gaps, matches, etc.)

### Allignement

#### DNA

HBA1 vs HBA2  
Percentage Identity: 557/577(97%)

HBA1 vs HBB  
BLASTn of HBA1 (NM_000558) against HBB (NM_000518) returned a marginal match with 44% query coverage, 75% identity

HBA2 vs HBB
BLASTn of HBA1 (NM_000558) against HBB (NM_000518) returned a marginal match with 45% query coverage, 75% identity in the best HSP, and E-value 6e-07.

#### Protein

HBA1 vs HBB
43.45% Identity

HBA2 vs HBB
43.45% Identity

HBA1 vs HBA2
100 % Identity


The results are as expected, for protein allignement HBA1 and HBA2 have 100% identity as they encode the identical alpha-globin protein.

