# ----- 23/04/2021-----------
    
# R_code_multivariate_analysis.r


library(raster)
library(RStoolbox)

setwd("C:/lab/") 

p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011
plot(p224r63_2011)

plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2)
# 1° argomento = asse x
# 2° argomento = asse y
# col -> colora i punti
# pch -> contrassegna i punti col modello 19 (da internte)
# cex -> aumentare dimensione dei punti

# Si ottiene un grafico rappresentante la riflettanza di ciascun pixel per le bande considerate

# PAIRS -> plottare tutte le correlazioni possibili fra tutte le variabili ( cioè le bande) di un dataset
pairs(p224r63_2011)
# Indice di correlazione:  varia fra -1 e 1
# -> se perfettamente correlati = 1
# -> se mal correlati = -1 (all'aumentare di uno diminuisce l'altro)
