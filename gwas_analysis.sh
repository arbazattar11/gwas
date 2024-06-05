# Variables
GENOTYPE_PREFIX="/path/to/genotype_data"  # Prefix for .bed, .bim, .fam files
PHENOTYPE_FILE="/path/to/phenotype_data.txt"
OUTPUT_DIR="/path/to/output"
PLINK="/path/to/plink"
R_SCRIPT="/path/to/gwas_analysis.R"

# Create necessary directories
mkdir -p ${OUTPUT_DIR}

# Step 1: Quality control with PLINK
${PLINK} --bfile ${GENOTYPE_PREFIX} --maf 0.05 --geno 0.05 --hwe 1e-6 --mind 0.1 --make-bed --out ${OUTPUT_DIR}/qc_filtered

# Step 2: Association analysis with PLINK
${PLINK} --bfile ${OUTPUT_DIR}/qc_filtered --pheno ${PHENOTYPE_FILE} --assoc --out ${OUTPUT_DIR}/gwas_results

# Step 3: Post-GWAS analysis and visualization in R
Rscript ${R_SCRIPT} ${OUTPUT_DIR}/gwas_results.assoc ${OUTPUT_DIR}
