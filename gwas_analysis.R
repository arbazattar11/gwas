args <- commandArgs(trailingOnly=TRUE)
gwas_results <- args[1]
output_dir <- args[2]

# Load necessary libraries
library(qqman)

# Read in GWAS results
gwas_data <- read.table(gwas_results, header=TRUE)

# Create Manhattan plot
manhattan(gwas_data, chr="CHR", bp="BP", snp="SNP", p="P", 
          main="Manhattan Plot", col=c("blue4", "orange3"), 
          ylim=c(0, -log10(min(gwas_data$P, na.rm=TRUE))), 
          suggestiveline=-log10(1e-5), genomewideline=-log10(5e-8))

# Save Manhattan plot
dev.copy(png, filename=paste0(output_dir, "/manhattan_plot.png"))
dev.off()

# Create QQ plot
qq(gwas_data$P, main="QQ Plot of GWAS p-values")

# Save QQ plot
dev.copy(png, filename=paste0(output_dir, "/qq_plot.png"))
dev.off()
