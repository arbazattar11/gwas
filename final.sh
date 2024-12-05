plink2 --vcf example.vcf --make-bed --out seed
vcftools --vcf example.vcf --min-alleles 2 --max-alleles 2 --recode --out biallelic
plink2 --vcf biallelic.vcf --make-bed --out seed
plink2 --bfile dataset_maf --pheno pheno.txt --glm allow-no-covars --out association_results2
