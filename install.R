if ("BiocManager" %in% rownames(installed.packages()))
	remove.packages("BiocManager")

install.packages("BiocManager", repos="https://cran.rstudio.com")
library(BiocManager)
bioc_version = BiocManager::version()

builtins <- c("SydneyBioX/scMerge", "knitr", "rmarkdown", "BiocStyle", "scater", "qpdf")

for (builtin in builtins){
    if (!suppressWarnings(require(builtin, character.only=TRUE)))
        suppressWarnings(BiocManager::install(builtin,
                                              version=bioc_version,
                                              update=TRUE, ask=FALSE))}