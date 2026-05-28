# Day 08 - 2026-04-24
## Exercise 1 - Setup ENV
- Environment was setup using conda and commands described in `20260424_sequence_analysis.ipynb`

## Exercise 2 - Alignment Pipeline
Pipeline was run using 
- `sample_A/20260424_01_SequenceQC.ipynb`
- `sample_A/20260424_02_alignment_and_variant_calling.ipynb`
- `sample_A/20260424_03_variant_calling_and_filtering.ipynb`
- `sample_A/20260424_04_variant_calling_SV.ipynb`

on sample A. 

### Exercise 2.1 - Pipeline on Sample B
> Run the whole pipeline on sampleB 
> - Sequence QC
> - Alignemnt
> - Alignemnt post process
> - Variant calling
> - Create combine VCF between sampleA and sampleB
> - Variant filtering

Pipeline B was run using notebook `sample_A/20260424_05_pipeline_sampleB.ipynb`

*I've put everything in the `sample_A` folder, as creating a new folder for sample B as originally intendend does not make sense, as the files from sample A and the reference are still needed for pipeline B. Sorry about that.*