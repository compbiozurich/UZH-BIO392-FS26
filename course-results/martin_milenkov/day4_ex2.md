# Day 4, exercise 2

## EMBOSS
- parameters: Gap open 12, gap extend 2
- resulting score = 44
- output stored as emboss_stretcher-I20260417-140033-0216-50512753-p1m.out

## BLAST
- parameters: E-threshold 10, matrix BLOSUM62
- top 10 proteins:
    - axin-1 isoform a [Homo sapiens]
    - axin-1 isoform b [Homo sapiens]
    - Axis inhibition protein 1 [Macaca fascicularis]
    - axin-1 isoform X2 [Oryctolagus cuniculus]
    - PREDICTED: axin-1 isoform X1 [Chinchilla lanigera]
    - axin-1 isoform X1 [Microcebus murinus]
    - axin-1 isoform X3 [Macaca nemestrina]
    - axin-1 isoform 2 [Mus musculus]
    - axin-1 isoform X1 [Vulpes lagopus]
- E-value - corresponds to a p-value corrected for multiple testing, and represents the confidence that both sequences alignment is not just by chance
- bit score - normalized score on quality of the alignment between both sequences, independent of the database
- percent identity - how much both sequences overlap, counting gaps
- alignment length - length of sequences when aligned, counting gaps