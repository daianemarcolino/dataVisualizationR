

# lista de programas + versões ----------------------------

# R - 3.4.0 - https://cran.rstudio.com/bin/windows/base/
# RStudio - 1.0.143 -  https://www.rstudio.com/products/rstudio/download2/
# Miktex - 2.9 - http://www.miktex.org/download

# lista de pacotes ----------------------------------------

# pacote pacman instala e carrega tudo de uma vez só com a função p_load()
install.packages("pacman")
library("pacman")

# pacotes usados nas aulas
p_load(readxl, ggplot2, plotly, corrplot, plotrix, 
       RColorBrewer, VennDiagram, visNetwork, treemap, tm,
       wordcloud, wordcloud2, BETS, devtools, dygraphs,
       rmarkdown, flexdashboard, shiny, shinydashboard, shinythemes)

install.packages("BiocManager")
BiocManager::install("limma")
library(limma)
