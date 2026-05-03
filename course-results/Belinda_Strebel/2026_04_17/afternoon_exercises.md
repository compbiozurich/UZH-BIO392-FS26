## Needleman-Wunsch table to optimal sequence 
possible optimal sequences: 
- AATCTAT-
- AA--GATA

## EMBOSS-Stretcher 
Matrix: EBLOSUM62
Gap_penalty: 12
Extend_penalty: 2
Length: 15
Identity: 11/15 (73.3%)
Similarity: 11/15 (73.3%)
Gaps: 3/15 (20%)
Score: 44

## BLAST of AXIN1_HUMAN
top 10 hits: 
| Rank | Protein | Organism | % Identity | E-value | Score |
|------|---------|----------|-----------|---------|-------|
| 1 | Axin-1 isoform a | *Homo sapiens* | 100.00% | 0.0 | 1776 |
| 2 | Axin-1 isoform b | *Homo sapiens* | 95.82% | 0.0 | 1683 |
| 3 | Axis inhibition protein 1 | *Macaca fascicularis* (macaque) | 93.83% | 0.0 | 1579 |
| 4 | Axin-1 isoform X2 | *Oryctolagus cuniculus* (rabbit) | 87.54% | 0.0 | 1517 |
| 5 | PREDICTED: axin-1 isoform X1 | *Chinchilla lanigera* (chinchilla) | 88.58% | 0.0 | 1512 |
| 6 | Axin-1 isoform X1 | *Microcebus murinus* (mouse lemur) | 88.13% | 0.0 | 1497 |
| 7 | Axin-1 isoform X3 | *Macaca nemestrina* (pig-tailed macaque) | 97.28% | 0.0 | 1468 |
| 8 | Axin-1 isoform 2 | *Mus musculus* (mouse) | 86.97% | 0.0 | 1460 |
| 9 | Axin-1 isoform X1 | *Vulpes lagopus* (Arctic fox) | 83.81% | 0.0 | 1456 |
| 10 | Axin-1 isoform X1 | *Saccopteryx bilineata* (bat) | 86.85% | 0.0 | 1456 |

### E-value (Expect value)
The E-value describes how many hits of equal or better quality you would 
expect to find by chance in the database. 
- A lower E-value = more significant hit
- E-value of 0.0 means the match is so good it is statistically impossible 
  to be random
- General thresholds: E < 0.001 is considered significant

### Bit Score
The bit score is a normalized alignment score that measures the quality 
of the alignment independent of database size.
- A higher bit score = better alignment
- It accounts for the scoring matrix used (e.g. BLOSUM62) and gap penalties
- In our results, scores range from 1432 to 1776, all indicating 
  extremely high-quality alignments

### % Identity
Percentage identity describes the proportion of aligned positions where 
the two sequences share the exact same amino acid.
- 100% = identical sequences (e.g. axin-1 isoform a in Homo sapiens)
- ~83-88% = highly conserved across distant mammals (e.g. bat, mouse)
- High % identity across species indicates strong evolutionary conservation,
  which in the case of AXIN1 reflects its essential role in Wnt signalling

### Alignment Length (Query Coverage)
Query coverage shows what percentage of the query sequence is covered 
by the alignment.
- 100% coverage means the full length of the query protein aligns to the hit
- Most top hits show 100% query coverage, confirming these are full-length 
  orthologues and not just partial domain matches
- Lower coverage (e.g. 85%) may indicate the hit is a shorter isoform 
  or a partial sequence

## Homework 
### human 
HBA1 vs HBA2: 
- Matrix: EDNAFULL
- GAp_penalty: 16
- Extend_penalty: 4
- Length: 134
- Identity: 52/134
- Similarity: 22/134
- Gaps: 24/134
- Score: -113

HBA1 vs HBB: 
- Matrix: EDNAFULL
- GAp_penalty: 16
- Extend_penalty: 4
- Length: 147
- Identity: 22/147
- Similarity: 14/147
- Gaps: 37/147
- Score: -235

HBA2 vs HBB
- Matrix: EDNAFULL
- GAp_penalty: 16
- Extend_penalty: 4
- Length: 147
- Identity: 20/147
- Similarity: 21/147
- Gaps: 13/147
- Score: -162

### mouse (mus musculus) 
mice do not have HBA1 and HBA2 but several different HBB
