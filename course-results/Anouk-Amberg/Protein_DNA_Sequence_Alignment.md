
# DNA/Protein Sequence Alignment

We talked about hemoglobin, consisting of 4 subunits.
• In human, there are three genes HBA1, HBA2 and HBB genes
• Find out how similar are these genes on both DNA and protein level using appropriate local
alignment tool

### Human hemoglobin subunits (Protein sequences)

- **HBA1**: G3V1N2 · G3V1N2_HUMAN
    MFLSFPTTKTYFPHFDLSHGSAQVKGHGKKVADALTNAVAHVDDMPNALSALSDLHAHKLRVDPVNFKLLSHCLLVTLAAHLPAEFTPAVHASLDKFLASVSTVLTSKYR

- **HBA2**: A0A2R8Y7C0 · A0A2R8Y7C0_HUMAN
    XKAAWGKVGAHAGEYGAEALERMFLSFPTTKTYFPHFDLSHGSAQVKGHGKKVADALTNAVAHVDDMPNALSALSDLHAHKLRVDPVNFKVSGGPGAIWVEGRDGAFLSGQRITRVAGGVAQAAAAGLGRTDPL

- **HBB**: P68871 · HBB_HUMAN
    MVHLTPEEKSAVTALWGKVNVDEVGGEALGRLLVVYPWTQRFFESFGDLSTPDAVMGNPKVKAHGKKVLGAFSDGLAHLDNLKGTFATLSELHCDKLHVDPENFRLLGNVLVCVLAHHFGKEFTPPVQAAYQKVVAGVANALAHKYH

### Mouse hemoglobin (Protein sequences)

- **HBB1**: P02088 · HBB1_MOUSE
    MVHLTDAEKAAVSCLWGKVNSDEVGGEALGRLLVVYPWTQRYFDSFGDLSSASAIMGNAKVKAHGKKVITAFNDGLNHLDSLKGTFASLSELHCDKLHVDPENFRLLGNMIVIVLGHHLGKDFTPAAQAAFQKVVAGVATALAHKYH

- **HBA**: P01942 · HBA_MOUSE
    MVLSGEDKSNIKAAWGKIGGHGAEYGAEALERMFASFPTTKTYFPHFDVSHGSAQVKGHGKKVADALASAAGHLDDLPGALSALSDLHAHKLRVDPVNFKLLSHCLLVTLASHHPADFTPAVHASLDKFLASVSTVLTSKYR


### Human hemoglobin subunits (DNA sequences)

can be found in NIH (National Library of Medicine)

- **HBA1**: 

- **HBA2**:

- **HBB**: 

## EMBOSS Stretcher

***Some general information to EMBOSS Stretcher***
**Matrix**: EBLOSUM62
**Gap penalty**: 12
**Extend penalty**: 2

### Protein sequence alignment

- **HBA1 & HBA2**: 
    **Length**: 136
    **Identity**: 52.9%
    **Similarity**: 60.3%
    **Score**: 263

- **HBA1 & HBB**:
    **Length**: 147
    **Identity**: 33.3%
    **Similarity**: 46.9%
    **Score**: 150

- **HBA2 & HBB**:
    **Length**: 154
    **Identity**: 31.8%
    **Similarity**: 45.5%
    **Score**: 115

### DNA sequence alignment


In general, Protein sequences are more conserved than DNA sequences. This is due to the functional structure of the protein.