install.packages("devtools")
install.packages("readr")
install.packages("ggplot2")
install.packages("tidyverse")
install.packages("readr")
install.packages("rlist")
install.packages("bedr")
install.packages("plink")
install.packages("qqman")
install.packages("vcfR")

install.packages("kableExtra")
install.packages("gghighlight")

library(devtools)
devtools::install_github("haozhu233/kableExtra")

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("qvalue")
BiocManager::install("fgsea")
BiocManager::install("eQTL")
BiocManager::install("topGO")
