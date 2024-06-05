# Genome-Wide Association Study (GWAS) Analysis Pipeline

This repository contains scripts for conducting a genome-wide association study (GWAS) using genotype and phenotype data. The pipeline includes quality control, association testing, and visualization of results.

## Overview

The analysis pipeline performs the following steps:
1. Quality control of genotype data using PLINK.
2. Association testing using PLINK.
3. Post-GWAS analysis and visualization using R.

## Requirements

### Software
- [PLINK](https://www.cog-genomics.org/plink/)
- [R](https://www.r-project.org/)
- R packages: `qqman`

### Data
- Genotype data in PLINK format (e.g., `.bed`, `.bim`, `.fam` files).
- Phenotype data file.

## Setup

1. Install the required software tools:
    - [PLINK](https://www.cog-genomics.org/plink/)
    - [R](https://www.r-project.org/)
    - R package `qqman`: Install this by running `install.packages("qqman")` in R.

2. Ensure the genotype and phenotype data files are prepared and accessible.

## Usage

1. Clone this repository or download the scripts.

    ```bash
    git clone https://github.com/arbazattar11/gwas
    cd gwas
    ```

2. Modify the variables in the script (`gwas_analysis.sh`) to match your data and paths:
    - `GENOTYPE_PREFIX`: Prefix for the `.bed`, `.bim`, and `.fam` files.
    - `PHENOTYPE_FILE`: Path to the phenotype data file.
    - `OUTPUT_DIR`: Directory where output files will be saved.
    - `PLINK`: Path to the PLINK executable.
    - `R_SCRIPT`: Path to the R script for post-GWAS analysis.

3. Make the script executable:

    ```bash
    chmod +x gwas_analysis.sh
    ```

4. Run the script:

    ```bash
    ./gwas_analysis.sh
    ```

## Script Details

### gwas_analysis.sh

This bash script performs the following steps:

1. **Quality Control**: Filters genotype data based on minor allele frequency (MAF), genotype missingness, Hardy-Weinberg equilibrium (HWE), and sample missingness.
2. **Association Testing**: Performs GWAS using PLINK.
3. **Post-GWAS Analysis**: Calls an R script to generate Manhattan and QQ plots.

### gwas_analysis.R

This R script performs the following tasks:

1. **Read GWAS Results**: Loads the association results file generated by PLINK.
2. **Manhattan Plot**: Creates and saves a Manhattan plot of the GWAS results.
3. **QQ Plot**: Creates and saves a QQ plot of the GWAS p-values.

## Output

The script generates several output files and directories:
- `qc_filtered.*`: Quality-controlled genotype data.
- `gwas_results.assoc`: Association test results.
- `manhattan_plot.png`: Manhattan plot of GWAS results.
- `qq_plot.png`: QQ plot of GWAS p-values.

## Troubleshooting

If you encounter any issues, ensure that:
- All paths and filenames are correct.
- All required software tools are installed and accessible.
- Necessary R packages are installed (e.g., `qqman`).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [PLINK](https://www.cog-genomics.org/plink/) for GWAS analysis.
- [R](https://www.r-project.org/) and [qqman](https://cran.r-project.org/web/packages/qqman/index.html) for post-GWAS analysis and visualization.

## Contact

For any questions or issues, please contact [Arbaz] at [arbazattar1137@gmail.com].
