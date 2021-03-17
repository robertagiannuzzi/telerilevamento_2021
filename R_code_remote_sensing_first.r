#My first code in R 

#install.packages("raster") già fatto 
library(raster) #
#funzione brick è della libreria raster quindi non funzionerebbe senza il richiamo alla library raster

setwd("C:/lab/")

p224r63_2011 <- brick("p224r63_2011_masked.grd") #brick importa blocco immagini come unica immagine
#file esterno a R poichè si trova nella cartella lab
p224r63_2011

plot(p224r63_2011) #plot stampa a video
#B1 riflette nella banda del blu, B2 nel verde, B3 nel rosso, B4 nell'infrarosso vicino, 
#B5 nell'infrarosso medio, B6 nell'infrarosso termico, B7 nell'infrarosso sempre medio

#stabiliamo variazione colori
cl <-colorRampPalette(c("black","grey","light grey")) (100)
#c per creare vettore
#100 numero di livelli/colori intermedi; esterno alla funzione

plot(p224r63_2011, col=cl)

#color change -> new
cl <-colorRampPalette(c("green","magenta","orange","yellow")) (100)
plot(p224r63_2011, col=cl)
