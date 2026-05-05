# Exercise protein alignment

Can also be done with string db

## 1.**Ortholog VS paralog**

  • Compare alignment result of human HBA1, HBB to that of human HBB and mouse HBB


**Human HBB vs Mouse HBB**

*Percent Identity  Matrix* with Clustal
|           |       |        |
|-----------|-------|--------|
|CAG38767.1 | 100.00|   80.27|
|BAG16713.1 |  80.27|  100.00|

The allignement is **80.27%**

**With String-db:**

| Sequence           | Protein | Species        | Protein Name                       |
|--------------------|---------|----------------|---------------------------------------|
| ENSP00000494175    | HBB     | Homo sapiens   | Hemoglobin subunit beta               |
| ENSMUSP00000095794 | Hbb-bt  | Mus musculus   | Hemoglobin, beta adult t chain.       |
 
alignment score **250.8 bits**

**Human HBA1 vs Human HBB**

CLUSTAL O(1.2.4) multiple sequence alignment

HBA1      -----PQRKGQGC-CQG--------LLVSGGLQEGGHWCQRSLQVTKTYFAHWKDQS---
HBB       MVHLTPEEKSAVTALWGKVNVDEVGGEALGRLLVVYPWTQ-------RFFESFGDLSTPD
               *:.*.      *          . * *     * *        :*  : * *   

HBA1      --PNSASAKKHGITIMNAVGDAVTKIDDLKAGLFNLSELHAFTLRVDPANFKIFSQCMMV
HBB       AVMGNPKVKAHGKKVLGAFSDGLAHLDNLKGTFATLSELHCDKLHVDPENFRLLGNVLVC
             .. ..* ** .::.*..*.::::*:**. : .*****. .*:*** **:::.: :: 

HBA1      VIAILFPAEFTPEVHVAFDKFMACLALALAEKYR
HBB       VLDHHFGKEFTPPVQAAYQKVVAGVANALAHKYH
          *:   *  **** *:.*::*.:* :* ***.**:
|       |        |         |
|-------| -------|  -------|          
|   HBA1 |  100.00       |   35.16      |
|  HBB      |   35.16     |    100.00     |    

The allignement is **35.16%**

Comparing the two alignments, human HBB and mouse HBB show a much higher percent identity (80.27%) than human HBA1 vs human HBB (35.16%). At first glance this might seem counterintuitive, but the difference is explained by how the two pairs of genes diverged.
Human and mouse HBB are orthologs: they descended from a single HBB gene in the common mammalian ancestor and split only when the human and mouse lineages diverged. Both copies retained exactly the same function (β-chain of adult hemoglobin), so selection has kept them very similar.  
Human HBA1 and human HBB, in contrast, are paralogs: they descended from an ancient gene-duplication event in a common vertebrate ancestor. After duplication, the two copies were free to specialize — HBA became the α-chain and HBB became the β-chain of the hemoglobin tetramer. Because they evolved separate functional roles, selection allowed them to diverge much more, and they accumulated mutations independently for far longer than the human/mouse HBB pair.




## 2. MSA

• Take human HBA

• Find orthologs from mouse, dog, chicken, zebrafish, salmon (and more) with eggNOG (think about which taxonomic level they share)

• Align them with Clustal Omega

>9606.ENSP00000251595 [human]
MVLSPADKTNVKAAWGKVGAHAGEYGAEALERMFLSFPTTKTYFPHFDLSHGSAQVKGHGKKVADALTNAVAHVDDMPNALSALSDLHAHKLRVDPVNFKLLSHCLLVTLAAHLPAEFTPAVHASLDKFLASVSTVLTSKYR

>8030.ENSSSAP00000001940
MERQQGEVKADRLERLDPLCDSEREMIKDTWAKVYQNCDDVGVAILIRLFVNCPSSKQYFSQFQQVEDPEELERSAQLRKHSRRVMNAINTLVENLHDGDKMVSVLKLLGKAHALRHKVEPVYFKILCGVILEVLVEDFPDCITPEVAGAWTKLLDAVYWHVKGVYEEVGWASSSAV

>9612.ENSCAFP00000035886 [dog]
MVLSPADKTNIKSTWDKIGGHAGDYGGEALDRTFQSFPTTKTYFPHFDLSPGSAQVKAHGKKVADALTTAVAHLDDLPGALSALSDLHAYKLRVDPVNFKLLSHCLLVTLACHHPTEFTPAVHASLDKFFTAVSTVLTSKYR

>10090.ENSMUSP00000020531 [mouse]
MSLMKNERAIIMSMWEKMAAQAEPIGTETLERLFCSYPQTKTYFPHFDLHHGSQQLRAHGFKIMTAVGDAVKSIDNLSSALTKLSELHAYILRVDPVNFKLLSHCLLVTMAARFPADFTPEVHEAWDKFMSILSSILTEKYR

>9031.ENSGALP00000038921 [chicken]
MALTQAEKAAVTTIWAKVATQIESIGLESLERLFASYPQTKTYFPHFDVSQGSVQLRGHGSKVLNAIGEAVKNIDDIRGALAKLSELHAYILRVDPVNFKLLSHCILCSVAARYPSDFTPEVHAAWDKFLSSISSVLTEKYR

>8030.ENSSSAP00000001940 [salmon]
MERQQGEVKADRLERLDPLCDSEREMIKDTWAKVYQNCDDVGVAILIRLFVNCPSSKQYFSQFQQVEDPEELERSAQLRKHSRRVMNAINTLVENLHDGDKMVSVLKLLGKAHALRHKVEPVYFKILCGVILEVLVEDFPDCITPEVAGAWTKLLDAVYWHVKGVYEEVGWASSSAV

>7955.ENSDARP00000100779[zebrafish]
MSLSDKDKAVVKAIWAKISPKADEIGAEALARMLTVYPQTKTYFSHWSDLSPGSGPVKKHGKTIMGAVGEAISKIDDLVGGLAALSELHAFKLRVDPANFKILSHNVIVVIAMLFPADFTPEVHVSVDKFFNNLALALSEKYR

**Allignement**

CLUSTAL O(1.2.4) multiple sequence alignment


8030.ENSSSAP00000001940[Salmo]           MERQQGEVKADRLERLDPLCDSEREMIKDTWAKVYQNCDDVGVAILIRLFVNCPSSKQYF	60
7955.ENSDARP00000100779[zebrafish]      ----------------MSLSDKDKAVVKAIWAKISPKADEIGAEALARMLTVYPQTKTYF	44
9606.ENSP00000251595[human]             ----------------MVLSPADKTNVKAAWGKVGAHAGEYGAEALERMFLSFPTTKTYF	44
9612.ENSCAFP00000035886[dog]            ----------------MVLSPADKTNIKSTWDKIGGHAGDYGGEALDRTFQSFPTTKTYF	44
10090.ENSMUSP00000020531[mouse]         ----------------MSLMKNERAIIMSMWEKMAAQAEPIGTETLERLFCSYPQTKTYF	44
9031.ENSGALP00000038921[chicken]        ----------------MALTQAEKAAVTTIWAKVATQIESIGLESLERLFASYPQTKTYF	44
                                                          *   ::  :   * *:  :    *   * * :   * :* **

8030.ENSSSAP00000001940[Salmo]           SQFQQVEDPEELERSAQLRKHSRRVMNAINTLVENLHDGDKMVSVLKLLGKAHALRHKVE	120
7955.ENSDARP00000100779[zebrafish]      SHWSDLS-----PGSGPVKKHGKTIMGAVGEAISKID---DLVGGLAALSELHAFKLRVD	96
9606.ENSP00000251595[human]             PHF-DLS-----HGSAQVKGHGKKVADALTNAVAHVD---DMPNALSALSDLHAHKLRVD	95
9612.ENSCAFP00000035886[dog]            PHF-DLS-----PGSAQVKAHGKKVADALTTAVAHLD---DLPGALSALSDLHAYKLRVD	95
10090.ENSMUSP00000020531[mouse]         PHF-DLH-----HGSQQLRAHGFKIMTAVGDAVKSID---NLSSALTKLSELHAYILRVD	95
9031.ENSGALP00000038921[chicken]        PHF-DVS-----QGSVQLRGHGSKVLNAIGEAVKNID---DIRGALAKLSELHAYILRVD	95
                                         :: ::        *  :: *.  :  *:   :  :.   .: . *  *.. **   :*:

8030.ENSSSAP00000001940[Salmo]           PVYFKILCGVILEVLVEDFPDCITPEVAGAWTKLLDAVYWHVKGVYEEVGWASSSAV	177
7955.ENSDARP00000100779[zebrafish]      PANFKILSHNVIVVIAMLFPADFTPEVHVSVDKFFNNLALALSEKYR----------	143
9606.ENSP00000251595[human]             PVNFKLLSHCLLVTLAAHLPAEFTPAVHASLDKFLASVSTVLTSKYR----------	142
9612.ENSCAFP00000035886[dog]            PVNFKLLSHCLLVTLACHHPTEFTPAVHASLDKFFTAVSTVLTSKYR----------	142
10090.ENSMUSP00000020531[mouse]         PVNFKLLSHCLLVTMAARFPADFTPEVHEAWDKFMSILSSILTEKYR----------	142
9031.ENSGALP00000038921[chicken]        PVNFKLLSHCILCSVAARYPSDFTPEVHAAWDKFLSSISSVLTEKYR----------	142
                                        *. **:*.  ::  :.   *  :** *  :  *::  :   :.  *.          


#  Percent Identity  Matrix - created by Clustal2.1 

     1: 8030.ENSSSAP00000001940[Salmo       100.00   27.97   29.58   31.69   32.39   35.21
     2: 7955.ENSDARP00000100779[zebrafish]   27.97  100.00   53.52   52.82   52.82   51.41
     3: 9606.ENSP00000251595[human]          29.58   53.52  100.00   83.10   54.93   57.75
     4: 9612.ENSCAFP00000035886[dog]         31.69   52.82   83.10  100.00   54.93   54.23
     5: 10090.ENSMUSP00000020531[mouse]      32.39   52.82   54.93   54.93  100.00   67.61
     6: 9031.ENSGALP00000038921[chicken]     35.21   51.41   57.75   54.23   67.61  100.00

The Identy matrix shows that human and dog sequence have the highest allignement score.