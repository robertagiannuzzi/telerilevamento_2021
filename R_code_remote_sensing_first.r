#My first code in R 

#install.packages("raster") già fatto 
library(raster) #richiamiamo il pacchetto raster
#carica in automatico anche il pacchetto sp che gestisce i dati raster all'interno del software
#funzione brick è della libreria raster quindi non funzionerebbe senza il richiamo alla library raster

setwd("C:/lab/")

p224r63_2011 <- brick("p224r63_2011_masked.grd") #brick importa blocco immagini come unica immagine
#file esterno a R poichè si trova nella cartella lab -> fra virgolette "
#con <- facciamo una assegnazione
p224r63_2011

plot(p224r63_2011) #plot stampa a video
#Bande Landsat
#B1 riflette nella banda del blu
#B2 riflette nel verde
#B3 riflette nel rosso
#B4 riflette nell'infrarosso vicino 
#B5 nell'infrarosso medio
#B6 riflette nell'infrarosso termico
#B7 riflette nell'infrarosso medio

#stabiliamo variazione colori
cl <-colorRampPalette(c("black","grey","light grey")) (100)
#c per creare vettore
#100 numero di livelli/colori intermedi; esterno alla funzione

plot(p224r63_2011, col=cl)
# 1° argomento del plot=immagine
# 2° argomento = vettore dei colori
#col significa colore, definisce infatti la scala cromatica

dev.off() #chiude interfaccia grafica aperta

#color change -> new
cln <-colorRampPalette(c("light blue","yellow","pink","magenta")) (250)
plot(p224r63_2011, col=cln)

#24/03/2021

# $ simbolo per legare due oggetti
plot(p224r63_2011$B1_sre) #plotta solo la banda B1

# plot band 1 with a predefined colut ramp palette
cl1<- colorRampPalette(c("light blue","blue", "purple")) (100)
plot(p224r63_2011$B1_sre, col=cl1)
dev.off()

#funzione par serve per fare settaggio dei parametri grafici di un certo grafico che vogliamo creare

#31/03/2021
#Multitemporal set
p224r63_1988 <- brick("p224r63_1988_masked.grd")
p224r63_1988

plot(p224r63_2011) #plottiamo le singole bande
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")

#creare un multiframe con par e poi inserire le due immagini 1988 e 2011



