## Standards

## Genomic variant formats: ISCN
- Annotation format for chromosomal aberrations (quantitative abnormalities in karyotypes)
- example: 39-52,XY,+X,-1,t(2:17)(q14;q21),+3,+4,+5,+6,+7,-8,+8,t(8;22)(q24;q11),...
  - t stands for translocation > 8th chromosome q24 to 22nd chromosome q11
  - this is example for Burkitt Lymphoma myc oncogene translocation

### Genome coordinates

Genome coordinates are a standardized way to specify the exact location of a DNA sequence within a genome.


There are 2 types of systems and different file formats use different counting strategies:

- **1-based/1-start/fully-closed** (e.g., VCF, SAM, GFF): counting starts at 1. Position 1 is the very first nucleotide.


- **0-based/0-start/half-open** (e.g., BED, BAM): counting starts at 0. The first nucleotide is at position 0. (like in python)
  - Definition: 2 integers that define the start and end positions of range of residues, possibly with length 0, and specified using 0-start coordinates.
  - coordinates start at 0 and finish at length of the sequence
  - end must be greater than start
  the length of an interval is: end-start
  - the reverse start is: sequence length-end
  - the reverse end is: sequence length-(start-1)
  - 0-length interval is a point between 2 residues (start == end)
  - an interval length of 1 i a residue position
  - 2 intervals are equal if their start and end are equal
  - 2 intervals intersect if start or end occurs between start and end of the other
  2 intervals coincide if they intersect or if they are equal



### Dates and Times

There is only ISO way!!

Examples:<br>
YYYY-MM-DDTHH:MM:SS.SSS <br>
2015-02-10T00:03:42.123Z
- T indicates a following time description
- SSS represents a decimal fraction of a second

My time-anchored age in ISO:
2004-01-28T14:35:00.000
(I don't know the millisecond :/)















