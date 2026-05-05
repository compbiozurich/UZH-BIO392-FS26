# Protein Alignment
## h-HBA1 and h-HBB
Comparing alignment between 
- [h-HBA1](https://www.ncbi.nlm.nih.gov/protein/AAK61216.1)
- [h-HBB](https://www.ncbi.nlm.nih.gov/protein/CAG38767.1)

Alignment
```text
CLUSTAL O(1.2.4) multiple sequence alignment


AAK61216.1      -MVLSPADKTNVKAAWGKVGAHAGEYGAEALERMFLSFPTTKTYFPHFD------LSHGS	53
CAG38767.1      MVHLTPEEKSAVTALWGKVNV--DEVGGEALGRLLVVYPWTQRFFESFGDLSTPDAVMGN	58
                 : *:* :*: *.* ****..  .* *.*** *::: :* *: :*  *.         *.

AAK61216.1      AQVKGHGKKVADALTNAVAHVDDMPNALSALSDLHAHKLRVDPVNFKLLSHCLLVTLAAH	113
CAG38767.1      PKVKAHGKKVLGAFSDGLAHLDNLKGTFATLSELHCDKLHVDPENFRLLGNVLVCVLAHH	118
                 :**.***** .*:::.:**:*:: .::::**:**..**:*** **:**.: *: .** *

AAK61216.1      LPAEFTPAVHASLDKFLASVSTVLTSKYR	142
CAG38767.1      FGKEFTPPVQAAYQKVVAGVANALAHKYH	147
                :  **** *:*: :*.:*.*:..*: **:
```

Distance Matrix
```text 
#
#
#  Percent Identity  Matrix - created by Clustal2.1 
#
#

     1: AAK61216.1  100.00   42.86
     2: CAG38767.1   42.86  100.00
 ```

For h-HBA1 and h-HBB we see an identity-% of 42.86

## h-HBB and mus-HBB
Comparing alignment between 
- [h-HBB](https://www.ncbi.nlm.nih.gov/protein/CAG38767.1)
- [mus-HBB](https://www.ncbi.nlm.nih.gov/protein/BAG16713.1)

Alignment
```text
CLUSTAL O(1.2.4) multiple sequence alignment


CAG38767.1      MVHLTPEEKSAVTALWGKVNVDEVGGEALGRLLVVYPWTQRFFESFGDLSTPDAVMGNPK	60
BAG16713.1      MVHLTDAEKSAVSCLWAKVNPDEVGGEALGRLLVVYPWTQRYFDSFGDLSSASAIMGNPK	60
                *****  *****:.**.*** ********************:*:******: .*:*****

CAG38767.1      VKAHGKKVLGAFSDGLAHLDNLKGTFATLSELHCDKLHVDPENFRLLGNVLVCVLAHHFG	120
BAG16713.1      VKAHGKKVITAFNEGLKNLDNLKGTFASLSELHCDKLHVDPENFRLLGNAIVIVLGHHLG	120
                ********: **.:** :*********:*********************.:* **.**:*

CAG38767.1      KEFTPPVQAAYQKVVAGVANALAHKYH	147
BAG16713.1      KDFTPAAQAAFQKVVAGVATALAHKYH	147
                *:*** .***:********.*******
```

Distance Matrix
```text
#
#
#  Percent Identity  Matrix - created by Clustal2.1 
#
#

     1: CAG38767.1  100.00   80.27
     2: BAG16713.1   80.27  100.00
```

For h-HBB and mus-HBB we see an identity-% of 80.27

### Conclusion
We see that h-HBA1 and h-HBB have a high identity% of 42.86 and mus-HBB has a high identity% of 80.27. The orthologues are clearly more similar than the paralogues, despite the longer sequences and the species barrier.

## MSA
Comparing alignment between HBA of
- human
- mouse 
- chicken
- zebrafish
- salmon

Alignment using eggNog variants yielded inconsistent results. Probably due to different subunits selected. I haven't found a way to constrain the eggNog search to orthologues only. Thus, I used UniProt which seemed to have worked much better. At least now the numbers make more sense...

| Species | UniProt ID |
|---|---|
| Human (*Homo sapiens*) | **P69905** |
| Mouse (*Mus musculus*) | **P01942** |
| Dog (*Canis lupus familiaris*) | **P60529** |
| Chicken (*Gallus gallus*) | **P01994** |
| Zebrafish (*Danio rerio*) | **Q90487** |
| Atlantic salmon (*Salmo salar*) | **P11748** |

Alignment
```text
CLUSTAL O(1.2.4) multiple sequence alignment


chicken        MVLSAADKNNVKGIFTKIAGHAEEYGAETLERMFTTYPPTKTYFPHF-DLSHGSAQIKGH	59
dog            -VLSPADKTNIKSTWDKIGGHAGDYGGEALDRTFQSFPTTKTYFPHF-DLSPGSAQVKAH	58
human          MVLSPADKTNVKAAWGKVGAHAGEYGAEALERMFLSFPTTKTYFPHF-DLSHGSAQVKGH	59
mouse          MVLSGEDKSNIKAAWGKIGGHGAEYGAEALERMFASFPTTKTYFPHF-DVSHGSAQVKGH	59
zebrafish      MSLSDTDKAVVKAIWAKISPKADEIGAEALARMLTVYPQTKTYFSHWADLSPGSGPVKKH	60
salmon         TTLSDKDKSTVKALWGKISKSADAIGADALGRMLAVYPQTKTYFSHWPDMSPGSGPVKAH	60
                 **  **  :*. : *:.  .   *.::* * :  :* ***** *: *:* **. :* *

chicken        GKKVVAALIEAANHIDDIAGTLSKLSDLHAHKLRVDPVNFKLLGQCFLVVVAIHHPAALT	119
dog            GKKVADALTTAVAHLDDLPGALSALSDLHAYKLRVDPVNFKLLSHCLLVTLACHHPTEFT	118
human          GKKVADALTNAVAHVDDMPNALSALSDLHAHKLRVDPVNFKLLSHCLLVTLAAHLPAEFT	119
mouse          GKKVADALASAAGHLDDLPGALSALSDLHAHKLRVDPVNFKLLSHCLLVTLASHHPADFT	119
zebrafish      GKTIMGAVGEAISKIDDLVGGLAALSELHAFKLRVDPANFKILSHNVIVVIAMLFPADFT	120
salmon         GKKVMGGVALAVTKIDDLTTGLGDLSELHAFKMRVDPSNFKILSHCILVVVAKMFPKEFT	120
               **.:  .:  *  ::**:   *. **:***.*:**** ***:*.: .:*.:*   *  :*

chicken        PEVHASLDKFLCAVGTVLTAKYR	142
dog            PAVHASLDKFFAAVSTVLTSKYR	141
human          PAVHASLDKFLASVSTVLTSKYR	142
mouse          PAVHASLDKFLASVSTVLTSKYR	142
zebrafish      PEVHVSVDKFFNNLALALSEKYR	143
salmon         PDAHVSLDKFLASVALALAERYR	143
               * .*.*:***:  :. .*: :**
```

Distance Matrix
```text
#
#
#  Percent Identity  Matrix - created by Clustal2.1 
#
#

     1: chicken     100.00   66.67   70.42   71.13   54.23   50.00
     2: dog          66.67  100.00   83.69   81.56   52.48   53.19
     3: human        70.42   83.69  100.00   85.92   53.52   54.93
     4: mouse        71.13   81.56   85.92  100.00   54.23   55.63
     5: zebrafish    54.23   52.48   53.52   54.23  100.00   67.83
     6: salmon       50.00   53.19   54.93   55.63   67.83  100.00
```

This matrix is biologically consistent with the vertebrate phylogeny: mammals cluster tightly (~82-86% identity), the two teleosts cluster together (zebrafish-salmon ~68%), chicken sits intermediate between mammals and fish (~67-71% to mammals), and mammal-to-fish identity drops to ~52-55%, exactly as expected since identity tracks divergence time. 

# ClinVar exercise 
with an added somatic variant
| Disease             | Description                              | Gene  | Example variant               | Mutation type | Functional effect                  |
|--------------------|------------------------------------------|-------|-------------------------------|---------------|------------------------------------|
| Hemochromatosis    | Excess iron accumulation                 | HJV   | NM_213653.3:c.959G>T          | Missense      | Likely LOF                         |
| Thalassemia        | Reduced hemoglobin production            | HBB   | NM_000518.5:c.20A>T           | Nonsense      | Loss of function (LOF)             |
| Cystic Fibrosis    | Thick mucus affecting lungs/digestion    | CFTR  | NM_000492.4:c.1521_1523delCTT | Deletion      | Loss of function (LOF)             |
| Tay-Sachs disease  | GM2 ganglioside accumulation in neurons  | HEXA  | NM_000520.6:c.1278insTATC     | Insertion     | Loss of function (LOF)             |
| Lung cancer (somatic) | Uncontrolled cell growth in lung tissue | EGFR  | NM_005228.5:c.2573T>G (L858R) | Missense      | Gain of function (oncogenic driver)|

# Uniprot exercise
| Field                         | Information                                                                 |
|------------------------------|-----------------------------------------------------------------------------|
| UniProt ID                   | Q01758                                                                      |
| Protein Name                 | Antifreeze protein type III                                                 |
| Length                       | 66 amino acids                                                              |
| Keywords                     | Antifreeze; Ice-binding; Secreted; Cold adaptation                          |
| Function                     | Binds to ice crystals and inhibits their growth, lowering freezing point    |
| Domains (DNA/Ligand binding) | Ligand-binding (ice surface); not DNA-binding                               |
| Gene Ontology                | Ice binding; response to cold; extracellular region                         |
| Mutations & Diseases         | No known human disease association; mutations affect ice-binding efficiency |
| Subcellular Location         | Extracellular (secreted into blood/plasma)                                  |
| Post-translational Modifications (PTM) | Disulfide bonds; signal peptide cleavage                          |
| Isoforms                     | Yes; multiple AFP types and isoforms exist                                  |
| Orthologs / Paralogs         | Found in fish, insects, plants; paralogs from gene duplication              |

### Exercise 4 - PDB Part 1
> Read https://pdb101.rcsb.org/learn/exploring-the-structural-biology-of-health-and-nutrition
> - Use one of them as your protein of interest
> - Download the PDBx file, from the file
> - Use this guide https://mmcif.wwpdb.org/docs/user-guide/guide.html
> - Find information about the citation, sequence, composition of macromolecules, mutation if any
> - Open the Structure Tab (3D viewer) Change the view to ball and stick,
> - Add annotation of 3rd modeled amino acid residue (Gray is unmodeled)

**Protein of interest: 3VCM**
- PDB Link: https://www.rcsb.org/structure/3VCM

**Citation**
- Morales R, Watier Y, Bocskei Z. "Human Prorenin Structure Sheds Light on a Novel Mechanism of Its Autoinhibition and on Its Non-Proteolytic Activation by the (Pro)renin Receptor." J Mol Biol. 2012;421(1):100-111
- PubMed: 22575890
- DOI: https://doi.org/10.1016/j.jmb.2012.05.003

**Experimental Summary**

| Field            | Value                       |
| ---------------- | --------------------------- |
| Method           | X-ray diffraction           |
| Resolution       | 2.93 Å                      |
| Space group      | P 4(3) 2 2                  |
| Cell (a, b, c)   | 104.42, 104.42, 237.12 Å    |
| R-work / R-free  | 0.2118 / 0.2478             |
| Released         | 2012-05-23 (rev 1.4, 2024)  |

**Macromolecule composition**

| Entity | Type        | Description                              | UNP range | MW (Da)   | Copies | Chains |
| ------ | ----------- | ---------------------------------------- | --------- | --------- | ------ | ------ |
| 1      | polypeptide | Prorenin (mature renin region)           | 67-406    | 36 721.5  | 2      | A, B   |
| 2      | polypeptide | Prorenin activation peptide              | 24-66     | 5 115.1   | 2      | P, Q   |
| 3      | non-polymer | N-acetyl-β-D-glucosamine (NAG)           | -         | 221.2     | 1      | -      |
| 4      | water       | H2O                                      | -         | 18.0      | 97     | -      |

**Sequence**
```text
LTLGNTTSSVILTNYMDTQYYGEIGIGTPPQTFKVVFDTGSSNVWVPSSKCSRLYTACVY
HKLFDASDSSSYKHNGTELTLRYSTGTVSGFLSQDIITVGGITVTQMFGEVTEMPALPFM
LAEFDGVVGMGFIEQAIGRVTPIFDNIISQGVLKEDVFSFYYNRDSLGGQIVLGGSDPQH
YEGNFHYINLIKTGVWQIQMKGVSVGSSTLLCEDGCLALVDTGASYISGSTSSIEKLMEA
LGAKKRLFDYVVKCNEGPTLPDISFHLGGKEYTLTSADYVFQESYSSKKLCTLAIHAMDI
PPPTGPTWALGATFIRKFYTEFDRRNNRIGFALAR
```

**Mutations**
- `_entity.pdbx_mutation` field: not set
- `_struct_ref_seq_dif`: an internal deletion of residues 232-236 (S-E-N-S-Q) in entity 1 (chains A and B), relative to canonical UNP P00797

#### 3D Viewer
**Default View**
![](./images/3VCN_Image_01.jpg)

**Ball and Stick View**
![](./images/3VCN_Image_02.jpg)

**Annotated 3rd AA residue**
![](./images/3VCN_Image_03.jpg)

### Exercise 5 - PDB Part 2
> Find the PDB entry of hemoglobin structure that is wild type and mutation
> - Load them onto https://www.rcsb.org/3d-view/
> - Select by Chain (default: Residue)
> - Superimpose the mutated and wild type chain.
> - Look at the structural difference

**Selected Proteins**
- Hemoglobin (wild type): [2DN2](https://www.rcsb.org/structure/2DN2)
- Hemoglobin (mutation, sickle cell): [2HBS](https://www.rcsb.org/structure/2HBS)

![](./images/2DN2_2HBS_Image_01.jpg) 

Now looking only at the mutated B chain: 
- Orange: wild type (2DN2)
- Blue: mutation (2HBS)

_This view was created using [PDB Aligment](https://www.rcsb.org/alignment) and TM align._

![](./images/2DN2_2HBS_Image_02.jpg) 
