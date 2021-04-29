# ----- 23/04/2021-----------
    
# R_code_multivariate_analysis.r


library(raster)
library(RStoolbox)

setwd("C:/lab/") 

p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011
plot(p224r63_2011)

plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2)
# col -> colora i punti
# pch -> contrassegna i punti col modello 19 (da internte)
# cex -> aumentare dimensione dei punti


