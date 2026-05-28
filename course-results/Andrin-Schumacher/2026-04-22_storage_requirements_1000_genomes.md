# Estimated storage requirements for 1000 genomes 
## WES & WGS
- WES: Whole exome sequencing -> only 1-2% of the whole human genome are covered, which are ~30Mb per genome
  - for 1000 genomes: 30000Mb
- WGS: Whole genome sequencing -> The whole human genome is covered -> 3000Mb per genome
  - for 1000 genomes: 3000000Mb
## File formats
The WES storage requirements were calculated by multiplying the WGS storage requirements with 1%
### SAM
- Sequence Alingment Map
- Text based -> readable for humans but very big
- storage requirements per genome (WGS): up to 500GB
- storage requirements per genome (WES): up to 5GB
### BAM
- Binary SAM
- not readable for humans but smaller than SAM (compressed)
- storage requirements per genome (WGS): up to 55GB
- storage requirements per genome (WES): up to 0.55GB
### VCF
- Variant Call Format
- Only contains variant calls -> small
- storage requirements per genome (WGS): ~3GB
- storage requirements per genome (WES): ~0.03GB
### FASTA
- Contains assembled reference genome
- storage requirements per genome (WGS): ~3GB
- storage requirements per genome (WES): ~0.03GB
## Costs
### Raw Storage Costs
- 550CHF ÷ 16TB = 34.38CHF/TB = 0.03438CHF/GB
#### Applied to the File Formats (for 1000 genomes):
##### SAM
- WGS: 17'190CHF
- WES: 171.9CHF
##### BAM
- WGS: 1'890.9CHF
- WES: 18.91CHF
##### VCF
- WGS: 103.14CHF
- WES: 1.03CHF
##### FASTA
- WGS: 103.14CHF
- WES: 1.03CHF
### Cost Factors 
The real costs are way bigger and there are other factors
- storage facilities, service etc.
- Long-term archival vs active storage
## Conclusion
Choosing a fitting file format and sequencing method strongly depends on purpose. If the WES information is sufficient, I would always choose it over WGS due to resource management. Regarding File Formats, I would ideally store most genomes in VCF format and then have i.e a FASTA reference for comparison. SAM files are better converted into BAM before storage again to better manage resources. SAM and BAM I would only use if absolutely required by the research question or context. 

