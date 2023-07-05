# Group-One-MR-Hackathon

## Investigating the causal relationship between HMGCR, as a drug target for LDL-lowering medication, and type 2 diabetes mellitus in African ancestry 

## Method
### Data source 
Exposure data was obtained from the GLGC African LDL cholesterol GWAS and the HMGCR region was extracted on chromosome 5 between the chromosomal regions 75336329-75364001. 
Outcome data was obtained from the publicly available GWAS Catalog from the Chen et al. study where they conducted a GWAS of type 2 diabetes mellitus in 2,633 African ancestry cases and 1,714 African ancestry controls. 

### Two-sample Mendelian randomization 
Two-sample Mendelian randomization was implemented with the inverse-variance weighted analyses as the main analysis. Sensitivity analyses using MR-Egger, weighted median and weighted mode were also conducted to evaluate if the underlying Mendelian randomization assumptions may be violated. 

Plots were then generated to visualise the results. 

### Limitations of analyses
The MR analyses was underpowered due to the low numbers of cases in the outcome data (i.e. 2,633 cases). For further analyses, the outcome GWAS on type 2 diabetes mellitus in African ancestry will be required to increase the statistical power of the analyses to be able to detect a causal effect. 



