#My first code in R 

#install.packages("raster") già fatto 
library(raster)
#funzione brick è della libreria raster quindi non funzionerebbe senza il richiamo alla library raster

setwd("C:/lab/")

p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011

plot(p224r63_2011)
