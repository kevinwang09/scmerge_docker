# DO NOT EDIT 'install.R'; instead, edit 'install.R.in' and
# use 'rake' to generate 'install.R'.

if ("BiocManager" %in% rownames(installed.packages()))
	remove.packages("BiocManager")

install.packages("BiocManager", repos="https://cran.rstudio.com")
#install.packages("devtools", repos="https://cran.rstudio.com")
#devtools::install_github("Bioconductor/BiocManager")
library(BiocManager)

bioc_version = "3.12"

if(BiocManager::version() != bioc_version){
    BiocManager::install(version=bioc_version,
                         update=TRUE, ask=FALSE)
}

builtins <- c("SydneyBioX/scMerge", "knitr", "rmarkdown", "BiocStyle", "scater", "qpdf")

for (builtin in builtins){
    if (!suppressWarnings(require(builtin, character.only=TRUE)))
        suppressWarnings(BiocManager::install(builtin,
                                              version=bioc_version,
                                              update=TRUE, ask=FALSE))}