######################################################################################################################################################
###Two-sample Mendelian randomization analysis examining the causal effect of the HMGCR gene region on type 2 diabetes mellitus in African ancestry###
######################################################################################################################################################

#Set working directory (please amend to your relevant directory) 
setwd('C:/Users/ac14629/OneDrive - University of Bristol/Documents/SRA Genetic Epidemiology/Short course/Hackathon')

# Read in relevant R packages 
library(TwoSampleMR)

#Read in exposure data. This data has already been formatted and clumped using the default clumping parameters 
exp_dat <- read.table("HMGCR_AFR_clumped.txt", header = T) 

#Read in outcome data 
out_dat <- read_outcome_data(exp_dat$SNP, sep="\t", filename = "Type2diabetes_AFR_annotated.txt", snp_col = "snp",beta_col = "Effect", se_col = "StdErr", effect_allele_col = "Allele1", other_allele_col = "Allele2", eaf_col = "Freq1", pval_col = "P.value")

#Harmonise exposure and outcome data
dat <- harmonise_data(exp, outcome_dat, action=2)

#Two-sample MR analyses
mr_results <- mr(dat, method_list=c("mr_ivw","mr_egger_regression","mr_weighted_median", "mr_weighted_mode"))
mr_results
results<-cbind.data.frame(mr_results$outcome,mr_results$nsnp,mr_results$method,mr_results$b,mr_results$se,mr_results$pval)
or <- generate_odds_ratios(mr_results)

# Generate plots
png("R_LDL_HMGCR_type2diabetes_scatter.png")
mr_scatter_plot(mr_results, dat)
dev.off()

res_single <- mr_singlesnp(dat)
png("./R_LDL_HMGCR_type2diabetes_forest.png")
mr_forest_plot(res_single)
dev.off()

png("./R_LDL_HMGCR_type2diabetes_funnel.png")
mr_funnel_plot(res_single)
dev.off()

res_loo <- mr_leaveoneout(dat)
png("./R_LDL_HMGCR_type2diabetes_loo.png")
mr_leaveoneout_plot(res_loo)
dev.off()
