#!/bin/bash
set -e  # Stop on first error

# ─── Activate conda environment ──────────────────────────────────────────────
source $(conda info --base)/etc/profile.d/conda.sh && \
conda activate sv_env && \

# ─── Unzip FastQC results ────────────────────────────────────────────────────
mkdir -p ./output/FastQC_Out  && \
fastqc -f fastq -t 2 -o ./output/FastQC_Out A_1.fq.gz A_2.fq.gz  && \
cd ./output/FastQC_Out  && \
unzip A_1_fastqc.zip && \
cd ..  && \
cd ..  && \

# ─── Fastp quality control ───────────────────────────────────────────────────
mkdir -p ./output/fastp && \
fastp -i ./data/FASTQ_Chr14/A_1.fq.gz \
    -I ./data/FASTQ_Chr14/A_2.fq.gz \
    -o ./output/fastp/clean_A_1.fq.gz \
    -O ./output/fastp/clean_A_2.fq.gz \
    -q 30 \
    -h ./output/fastp/A_fastp_report.html && \

# ─── BWA alignment ───────────────────────────────────────────────────────────
mkdir -p ./output/bwa && \
bwa mem -M -t 2 \
    -R "@RG\tID:A\tPL:ILLUMINA\tLB:lib1\tSM:A" \
    -o ./output/bwa/A.sam \
    ./reference/chr14.fa \
    ./output/fastp/clean_A_1.fq.gz \
    ./output/fastp/clean_A_2.fq.gz && \

# ─── Samtools: flagstat on raw SAM ───────────────────────────────────────────
samtools flagstat -@ 2 ./output/bwa/A.sam && \

# ─── Convert SAM to BAM ──────────────────────────────────────────────────────
samtools view -bS \
    -@ 2 \
    -o ./output/bwa/A.bam \
    ./output/bwa/A.sam && \

# ─── Sort BAM ────────────────────────────────────────────────────────────────
samtools sort -@ 2 \
    -o ./output/bwa/A_sort.bam \
    ./output/bwa/A.bam && \

# ─── Index sorted BAM ────────────────────────────────────────────────────────
samtools index -@ 2 ./output/bwa/A_sort.bam && \

# ─── Filter: keep only mapped reads (both read and mate mapped) ──────────────
# -F 12 excludes reads where the read OR its mate is unmapped (replaces -F 4 -F 8)
samtools view -b \
    -F 12 \
    -@ 2 \
    -o ./output/bwa/A_sort_map.bam \
    ./output/bwa/A_sort.bam && \

# ─── BWA mem pipe (sorted directly) ─────────────────────────────────────────
bwa mem -M -t 2 \
    -R "@RG\tID:A\tPL:ILLUMINA\tLB:lib1\tSM:A" \
    ./reference/chr14.fa \
    ./output/fastp/clean_A_1.fq.gz \
    ./output/fastp/clean_A_2.fq.gz | samtools sort -@ 2 -o ./output/bwa/A_sorted.bam - && \

# ─── Flagstats ───────────────────────────────────────────────────────────────
samtools flagstat ./output/bwa/A_sort.bam && \
samtools flagstat ./output/bwa/A_sort_map.bam && \
samtools flags 163 && \

# ─── Mark Duplicates ─────────────────────────────────────────────────────────
gatk --java-options "-Xmx4G" MarkDuplicates \
    -I ./output/bwa/A_sort.bam \
    -O ./output/bwa/A_sort_markdup.bam \
    -M ./output/bwa/A_sort_markdup_metrics.txt \
    --TMP_DIR . && \

# ─── Collect WGS Metrics ─────────────────────────────────────────────────────
gatk --java-options "-Xmx4G" CollectWgsMetrics \
    -MQ 20 -Q 20 \
    -R ./reference/chr14.fa \
    -O ./output/bwa/A_sort_markdup_WGSmetrics.txt \
    -I ./output/bwa/A_sort_markdup.bam && \

# ─── Index reference ─────────────────────────────────────────────────────────
samtools faidx ./reference/chr14.fa && \
gatk --java-options "-Xmx4G" CreateSequenceDictionary \
    -R ./reference/chr14.fa && \

# ─── Base Quality Score Recalibration ────────────────────────────────────────
mkdir -p ./output/bqsr && \
gatk --java-options "-Xmx4G" BaseRecalibrator \
    -R ./reference/chr14.fa \
    -I ./output/bwa/A_sort_markdup.bam \
    -O ./output/bqsr/A_sort_markdup_BQSR.report \
    --known-sites ./db/Homo_sapiens_assembly38.dbsnp138_roi.vcf.gz \
    --known-sites ./db/resources_broad_hg38_v0_Homo_sapiens_assembly38.known_indels.vcf.gz \
    --known-sites ./db/resources_broad_hg38_v0_Mills_and_1000G_gold_standard.indels.hg38.vcf.gz && \

gatk --java-options "-Xmx4G" ApplyBQSR \
    -I ./output/bwa/A_sort_markdup.bam \
    -O ./output/bqsr/A_sort_markdup_recal.bam \
    --bqsr-recal-file ./output/bqsr/A_sort_markdup_BQSR.report && \

# ─── HaplotypeCaller ─────────────────────────────────────────────────────────
mkdir -p ./output/haplotypecaller && \
mkdir -p ./tmp && \
gatk --java-options "-Xmx8G" HaplotypeCaller \
    -R ./reference/chr14.fa \
    -I ./output/bqsr/A_sort_markdup_recal.bam \
    -O ./output/haplotypecaller/A.g.vcf \
    -ERC GVCF \
    --tmp-dir ./tmp && \

# ─── Build sample map for GenomicsDBImport ───────────────────────────────────
ls ./output/haplotypecaller/*.g.vcf && \
ls ./output/haplotypecaller/*.g.vcf | xargs -n1 basename \
    | awk '{split($0,a,".");print a[1]}' > ./output/haplotypecaller/input_name.txt && \
cat ./output/haplotypecaller/input_name.txt && \
realpath ./output/haplotypecaller/*.g.vcf > ./output/haplotypecaller/input_path.txt && \
cat ./output/haplotypecaller/input_path.txt && \
paste ./output/haplotypecaller/input_name.txt \
    ./output/haplotypecaller/input_path.txt > ./output/haplotypecaller/samples_map.txt && \
cat ./output/haplotypecaller/samples_map.txt && \

# ─── GenomicsDBImport ────────────────────────────────────────────────────────
gatk --java-options "-Xms8G -Xmx16G" GenomicsDBImport \
    --genomicsdb-workspace-path ./output/genomeDB \
    --batch-size 50 \
    -L chr14 \
    --sample-name-map ./output/haplotypecaller/samples_map.txt \
    --tmp-dir ./tmp \
    --reader-threads 2 && \

# ─── GenotypeGVCFs ───────────────────────────────────────────────────────────
mkdir -p ./output/genotypegvcf && \
gatk --java-options "-Xmx8G" GenotypeGVCFs \
    -R ./reference/chr14.fa \
    -V ./output/haplotypecaller/A.g.vcf \
    -O ./output/genotypegvcf/A.vcf \
    --tmp-dir ./tmp && \

gatk --java-options "-Xmx8G" GenotypeGVCFs \
    -R ./reference/chr14.fa \
    -V gendb://${PWD}/output/genomeDB \
    -O ./output/genotypegvcf/combine.vcf \
    --tmp-dir ./tmp && \

# ─── VQSR ────────────────────────────────────────────────────────────────────
mkdir -p ./output/vqsr && \

gatk --java-options "-Xmx8G" VariantRecalibrator \
    -R ./reference/chr14.fa \
    -V ./output/genotypegvcf/combine.vcf \
    --resource:hapmap,known=false,training=true,truth=true,prior=15.0 ./db/vqsr/resources_broad_hg38_v0_hapmap_3.3.hg38.vcf.gz \
    --resource:omni,known=false,training=true,truth=false,prior=12.0 ./db/vqsr/resources_broad_hg38_v0_1000G_omni2.5.hg38.vcf.gz \
    --resource:1000G,known=false,training=true,truth=false,prior=10.0 ./db/vqsr/resources_broad_hg38_v0_1000G_phase1.snps.high_confidence.hg38_chr14roi.vcf.gz \
    --resource:dbsnp,known=true,training=false,truth=false,prior=2.0 ./db/Homo_sapiens_assembly38.dbsnp138_roi.vcf.gz \
    -an QD -an MQ -an MQRankSum -an ReadPosRankSum -an FS -an SOR \
    -mode SNP \
    --max-gaussians 4 \
    -O ./output/vqsr/vqsr_snp.recal \
    --tranches-file ./output/vqsr/vqsr_snp.tranches && \

gatk --java-options "-Xmx8G" VariantRecalibrator \
    -R ./reference/chr14.fa \
    -V ./output/genotypegvcf/combine.vcf \
    --resource:mills,known=false,training=true,truth=true,prior=12.0 ./db/resources_broad_hg38_v0_Mills_and_1000G_gold_standard.indels.hg38.vcf.gz \
    --resource:dbsnp,known=true,training=false,truth=false,prior=2.0 ./db/Homo_sapiens_assembly38.dbsnp138_roi.vcf.gz \
    -an QD -an MQRankSum -an ReadPosRankSum -an FS -an SOR -an DP \
    -mode INDEL \
    --max-gaussians 1 \
    -O ./output/vqsr/vqsr_indel.recal \
    --tranches-file ./output/vqsr/vqsr_indel.tranches && \

gatk --java-options "-Xmx8G" ApplyVQSR \
    -V ./output/genotypegvcf/combine.vcf \
    --recal-file ./output/vqsr/vqsr_snp.recal \
    -mode SNP \
    --tranches-file ./output/vqsr/vqsr_snp.tranches \
    --truth-sensitivity-filter-level 99.5 \
    --create-output-variant-index true \
    -O ./output/vqsr/combine_snp_recalibrated.vcf.gz && \

gatk --java-options "-Xmx8G" ApplyVQSR \
    -V ./output/vqsr/combine_snp_recalibrated.vcf.gz \
    -mode INDEL \
    --recal-file ./output/vqsr/vqsr_indel.recal \
    --tranches-file ./output/vqsr/vqsr_indel.tranches \
    --truth-sensitivity-filter-level 99.0 \
    --create-output-variant-index true \
    -O ./output/vqsr/combine_indel_snp_recalibrated.vcf.gz && \

# ─── VCFtools filter ─────────────────────────────────────────────────────────
vcftools --gzvcf ./output/vqsr/combine_indel_snp_recalibrated.vcf.gz \
    --recode \
    --recode-INFO-all \
    --remove-filtered-all \
    --out ./output/vqsr/combine_indel_snp_recalibrated && \

# ─── bgzip + tabix ───────────────────────────────────────────────────────────
bgzip -c ./output/vqsr/combine_indel_snp_recalibrated.recode.vcf \
    > ./output/vqsr/combine_indel_snp_recalibrated.recode.vcf.gz && \

tabix -p vcf ./output/vqsr/combine_indel_snp_recalibrated.recode.vcf.gz

echo "Pipeline complete!"
