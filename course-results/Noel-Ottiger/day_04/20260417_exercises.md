# Day 04 - 2026-04-17
## Morning
### Exercise 1 - Introduction to R
> Complete `exercise-code.r` by replacing all ???

- Completed exercise by workingon `20260417_exercise-code.r`

## Afternoon
### Exercise 2 - Needleman-Wunsch Algorithm
> Complete the table to align the sequences. Define the score: Match +1, Mismatch 0, Gap -1

|   |   | A  | A  | T  | C  | T  | A  | T  |
|---|---|----|----|----|----|----|----|----|
|   | 0 | -1 | -2 | -3 | -4 | -5 | -6 | -7 |
| A | -1| 1  | 0  | -1 | -2 | -3 | -4 | -5 |
| A | -2| 0  | 2  | 1  | 0  | -1 | -2 | -3 |
| G | -3| -1 | 1  | 2  | 1  | 0  | -1 | -2 |
| A | -4| -2 | 0  | 1  | 2  | 1  | 1  | 0  |
| T | -5| -3 | -1 | 1  | 1  | 3  | 2  | 2  |
| A | -6| -4 | -2 | 0  | 1  | 2  | 2  | 3  |

```text 
Row seq: A A G A T A -
Col seq: A A T C T A T
         | |     | |
        +1+1+0+0+1+1−1 = 3
```

### Exercise 4 - EMBOSS
> Run EMBOSS-Stretcher for these two sequences online
> - THISISASEQENCE and THISSEQENCE
> - What’s the default parameters used? Matrix, gap penalty, extend penalty
> - Derive the computed score as in the output

- Default parameters: 
  - Gap penalty: 12
  - Extend penalty: 2
  - Matrix: EBLOSUM62
- Computed score: 44

```text 
########################################
# Program: stretcher
# Rundate: Sun  3 May 2026 14:33:19
# Commandline: stretcher
#    -auto
#    -stdout
#    -asequence emboss_stretcher-I20260503-143315-0017-47080176-p1m.asequence
#    -bsequence emboss_stretcher-I20260503-143315-0017-47080176-p1m.bsequence
#    -datafile EBLOSUM62
#    -gapopen 12
#    -gapextend 2
#    -aformat3 pair
#    -sprotein1
#    -sprotein2
# Align_format: pair
# Report_file: stdout
########################################

#=======================================
#
# Aligned_sequences: 2
# 1: EMBOSS_001
# 2: EMBOSS_001
# Matrix: EBLOSUM62
# Gap_penalty: 12
# Extend_penalty: 2
#
# Length: 14
# Identity:      11/14 (78.6%)
# Similarity:    11/14 (78.6%)
# Gaps:           3/14 (21.4%)
# Score: 44
# 
#
#=======================================

EMBOSS_001         1 THISISASEQENCE     14
                     ||||   |||||||
EMBOSS_001         1 THIS---SEQENCE     11


#---------------------------------------
#---------------------------------------
```

### Exercise 5 - BLAST
> Run BLAST for a human protein online
> - Go to Uniprot database and find AXIN1_HUMAN entry
> - Paste its sequence to BLASTp
> - What are the top 10 proteins?
> - Use your own words to explain Expect (E-value), bit score, %identity, alignment length

**Top 10 Proteins**
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

**Explanations:**

- **E-value (Expect value)**: The number of alignments with similar or better scores that you would expect to find by
  random chance in a database of this size. Lower E-values (closer to 0) indicate more significant matches, while higher
  values suggest the match might be due to chance.
- **Bit score**: A normalized scoring value that indicates the quality of the alignment independent of database size.
  Higher bit scores indicate better alignments. Unlike E-values, bit scores can be compared across different database
  searches.
- **%identity**: The percentage of positions in the alignment where the two sequences have identical residues (amino
  acids or nucleotides). It represents how similar the sequences are at the exact matching level.
- **Alignment length**: The total number of positions in the alignment, including matches, mismatches, and gaps. This
  indicates how much of the sequences were aligned together.

### Exercise 6 - Homework
> In human, there are three genes HBA1, HBA2 and HBB genes
> - Find out how similar are these genes on both DNA and protein level using appropriate local alignment tool
> - And do the same for mouse (mus musculus)

