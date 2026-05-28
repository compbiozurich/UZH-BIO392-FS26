---
## Exercise

Good source for IGV tutorial : https://www.youtube.com/channel/UCb5W5WqauDOwubZHb-IA_rA

---
**Work on sample A**
Identify two variants: one with a moderate impact and one with a low impact. For each variant, answer the following:
* The variant type
* The REF and ALT alleles
* The genotype
* The exact read count supporting the REF and ALT alleles
* A screenshot of the variant captured from IGV
---

**Example 1:**

- 14:19433861-19433861

- Impact: LOW
- Variant type: SNP
- REF: G — ALT: T
- Genotype: Heterozygous (0/1) Allele Frequency = 0.5, Allele Count = 1 out of 2 total alleles
- Read counts: 
    - REF (G) Read Counts 203 reads (66%)
    - ALT (T) Read Count 104 reads (34%)Total Coverage307


![alt text](<Variant_1.png>)


## Variant 2 — MODERATE Impact
 
### Basic Information
 
| Field | Value |
|---|---|
| **Location** | chr14:19,413,462 |
| **Variant Type** | SNP |
| **REF Allele** | G |
| **ALT Allele** | C |
| **Genotype** | Heterozygous (0/1) |
| **Gene** | POTEG (ENSG00000187537) |
| **Transcript** | ENST00000622767.4 |
 
### Functional Annotation
 
| Field | Value |
|---|---|
| **Consequence** | Missense variant |
| **Impact** | MODERATE |
| **HGVSc** | ENST00000622767.4:c.1301C>G |
| **HGVSp** | p.Pro434Arg |
| **Codon Change** | CCT → CGT |
| **Amino Acid Change** | Proline → Arginine at position 434 |
| **Existing Variant** | rs199722113 / COSV73630428 |
| **Population AF** | 0.1436 |
 


![alt text](<Variant_2.png>)

--------------------------------------------------------------------------------


Using IGV, examine the structural variant (SV) in the `extract_variants.bam` file is this region
* chr1: 37350877 - 37351115
* chr1: 41369871 - 41369871
* chr2: 117564013 - 117572037

and answer the following:
* What type of structural variant do you believe this is?
* Capture an IGV screenshot confirming the event. Make sure the reads are colored appropriately to support your conclusion.

I believe the SV at chr1: 37350877 - 37351115 is an insertion as the the variant doesnt match the refernce genome at the specified spaces:
![alt text](<First_one.png>)

For the second one I said Inversion, because of the many LL RR reads.
![alt text](<Second_one.png>)

For the last one I said duplication because of the allignement and green colours (RL reads).
![alt text](<Last_one.png>)
