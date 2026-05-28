# CDKN2A — UniProt Protein Exercise
**UniProt ID:** P42771 (CDN2A_HUMAN)

---

## 1. Basic Protein Information

| Field | Details |
|---|---|
| UniProt ID | P42771 |
| Protein Name | Cyclin-dependent kinase inhibitor 2A (p16-INK4A / p16INK4a) |
| Gene | CDKN2A (aliases: MTS1, CDKN2, INK4A, MLM, p16, ARF) |
| Organism | Homo sapiens (Human) |
| Length | 156 amino acids (canonical isoform) |
| Molecular Weight | ~16–17 kDa |
| Chromosome | 9p21.3 |

Keywords: Tumor suppressor · Cell cycle · CDK inhibitor · Ankyrin repeat · Nucleus · Phosphoprotein · Alternative splicing · Disease variant · Cancer

## 2. Function

CDKN2A encodes two distinct proteins from the same genomic locus via alternative promoters and reading frames:

### p16INK4a (P42771 — canonical entry)
Acts as a negative regulator of cell proliferation by binding strongly to CDK4 and CDK6, preventing them from interacting with Cyclin D. This blocks phosphorylation of the retinoblastoma protein (RB1), causing G1-phase cell cycle arrest.


## 3. Domains

| Domain | Details |
|---|---|
| Ankyrin repeats (×4) | The defining structural feature of p16INK4a. Four tandem repeats of ~33 residues each, forming helix-turn-helix motifs. They stack linearly into two antiparallel α-helical bundles (~50 Å long). |
| CDK-binding interface | A concave surface formed by the ankyrin repeats. Key acidic residues (Asp74, Asp81, Glu87) form salt bridges with basic patches on CDK4/CDK6. |
| DNA-binding domain? | No. p16INK4a does not bind DNA directly. |
| Ligand-binding? | Protein–protein binding to CDK4 and CDK6 (no small-molecule ligand). p14ARF binds MDM2. |

---

## 4. Gene Ontology (GO)

### Molecular Function
- Cyclin-dependent protein serine/threonine kinase inhibitor activity
- Protein kinase binding
- RNA binding (p14ARF isoform)
- Transcription factor binding

### Biological Process
- Negative regulation of cell cycle (G1/S transition)
- Cellular senescence
- Tumor suppression
- Regulation of apoptosis
- p53 stabilization (p14ARF)
- Cell cycle arrest (G1 and G2)

### Cellular Component
- Nucleus
- Nucleoplasm
- Nucleolus (p14ARF — sequesters MDM2 here)

---

## 5. Mutations & Diseases

CDKN2A is one of the most frequently mutated tumor suppressor genes in human cancer.

| Disease | Association |
|---|---|
| Melanoma, cutaneous malignant 2 (CMM2) | Germline mutations; familial melanoma |
| Melanoma–Pancreatic Cancer Syndrome | Germline p16INK4a mutations predispose to both |
| Pancreatic ductal adenocarcinoma | Somatic deletion/mutation; LOH in preneoplastic lesions |
| Glioblastoma multiforme | Frequent somatic deletion |
| Bladder cancer | High frequency somatic deletion (~44%) |
| Head & neck squamous cell carcinoma (HNSCC) | Inactivation by mutation or hypermethylation |
| Esophageal cancer | Somatic deletion |
| *Childhood ALL | Inactivation by promoter hypermethylation |

**Variant types reported:**
- Missense mutations (most common for p16INK4a, e.g. exon 1α and exon 2)
- Frameshift / truncating mutations
- Splice site variants
- Promoter hypermethylation (epigenetic silencing)
- Homozygous deletion (LOH)

---

## 6. Sub-cellular Location

| Isoform | Location |
|---|---|
| p16INK4a | Nucleus / Nucleoplasm |
| p14ARF | Nucleolus (primary); also cytoplasm and mitochondria (N-terminal hydrophobic mitochondrial import sequences) |

---

## 7. Post-Translational Modifications (PTMs)

| PTM | Effect |
|---|---|
| Phosphorylation | Enhances interaction with CDK4. Increases inhibitory activity. |
| Acetylation | Reported on p16INK4a; functional significance under study. |

No glycosylation or ubiquitination are reported as primary regulatory PTMs for p16INK4a in UniProt.

---

## 8. Isoforms

The CDKN2A locus produces multiple isoforms via alternative promoters, first exons, and splicing:

| Isoform | Protein | AA Length | Notes |
|---|---|---|---|
| Isoform 1 (canonical) | p16INK4a | 156 aa | Ubiquitous CDK4/6 inhibitor |
| Isoform 2 | p16INK4a variant | ~148 aa | Structurally related to isoform 1 |
| Isoform 3 | p12 | — | Pancreas-specific expression |
| Isoform 4 (ARF) | p14ARF | 132 aa | Alternative reading frame; MDM2 inhibitor |
| Isoform 5 | p16γ | — | Tissue-specific |

The two major biologically distinct proteins — p16INK4a and p14ARF — share exons 2 and 3 but are translated from different reading frames and have no sequence homology to each other.

---

## 9. Orthologs & Paralogs

### Orthologs (selected)
| Species | Entry | Protein |
|---|---|---|
| Mus musculus (mouse) | P51480 | p16INK4a (Cdkn2a); the ARF counterpart is p19ARF |
| Rattus norvegicus | — | Cdkn2a orthologs present |
| Drosophila melanogaster | — | Rbf / Dacapo (functional analogs, not strict orthologs) |

### Paralogs (in humans)
| Gene | Protein | UniProt | Relationship |
|---|---|---|---|
| CDKN2B | p15INK4b | P42772 | Closest paralog; also inhibits CDK4/CDK6; adjacent on chr. 9p21; TGF-β induced |
| CDKN2C | p18INK4c | P42773 | INK4 family; inhibits CDK4/CDK6 |
| CDKN2D | p19INK4d | P55273 | INK4 family; inhibits CDK4/CDK6 |

All paralogs belong to the INK4 (Inhibitors of CDK4) family, defined by ankyrin repeat-based CDK4/CDK6 inhibition.

