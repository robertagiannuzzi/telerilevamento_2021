#My first code in R 

#install.packages("raster") già fatto 
library(raster) #richiamiamo il pacchetto raster
#carica in automatico anche il pacchetto sp che gestisce i dati raster all'interno del software
#funzione brick è della libreria raster quindi non funzionerebbe senza il richiamo alla library raster

setwd("C:/lab/")
#Imposta cartella di lavoro

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
# 1° argomento = immagine
# 2° argomento = vettore dei colori
#col significa colore, definisce infatti la scala cromatica

dev.off() #chiude interfaccia grafica aperta

#color change -> new
cln <-colorRampPalette(c("light blue","yellow","pink","magenta")) (250)
plot(p224r63_2011, col=cln)

#-----------24/03/2021--------------------

# $ simbolo per legare due oggetti
plot(p224r63_2011$B1_sre) #plotta solo la banda B1

# plot band 1 with a predefined color ramp palette
cl1<- colorRampPalette(c("light blue","blue", "purple")) (100)
plot(p224r63_2011$B1_sre, col=cl1)
dev.off()

#funzione par serve per fare settaggio dei parametri grafici di un certo grafico che vogliamo creare -> creiamo un multiframe
# 1 riga, 2 colonne
par(mfrow=c(1,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# mf = multiframe
# row = il primo numero del vettore c indica il numero di righe
# col = il primo numero del vettore c indica il numero di colonne

# 2 righe, 1 colonna
par(mfrow=c(2,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# plot the first four bands of Landsat
par(mfrow=c(4,1)) # 4 righe, 1 colonna
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

# a quadrat of bands:
par(mfrow=c(2,2)) # 2 righe, 2 colonna
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

# a quadrat of bands with change color:
par(mfrow=c(2,2))
clb<- colorRampPalette(c("light blue","blue", "dark blue")) (100)
clg<- colorRampPalette(c("light green","green", "dark green")) (100)
clr<- colorRampPalette(c("yellow","orange", "red")) (100)
clnir<- colorRampPalette(c("pink","magenta", "purple")) (100)
plot(p224r63_2011$B1_sre, col=clb)
plot(p224r63_2011$B2_sre, col=clg)
plot(p224r63_2011$B3_sre, col=clr)
plot(p224r63_2011$B4_sre, col=clnir)

#----------26/03/2021-------------------------

# RGB = "Red Green Blue", Schema visualizzazione colori
#Visualizzazione in colori naturali: 
#monto la banda R sul B3 che riflette nel rosso
#monto la banda G sul B2 che riflette nel verde
#monto la banda B sul B1 che riflette nel blu
plotRGB(p224r63_2011, r=3,g=2, b=1, stretch ="lin")
#argomento di stretch tra virgolette! -> stretchiamo i valori delle singole bande in modo lineare ("lin")
# per evitare concentrazione del colore
plotRGB(p224r63_2011, r=4,g=3, b=2, stretch ="lin")
#la vegetazione diventa rossa perchè sulla banda R abbiamo montato la B4 -> Vegetazione ha alta riflettanza nell'infrarosso
plotRGB(p224r63_2011, r=3,g=4, b=2, stretch ="lin")
plotRGB(p224r63_2011, r=3,g=2, b=4, stretch ="lin")

#Exercise: Mount a 4x4 multiframe
pdf("primo_pdf.pdf") #usare " perchè usciamo da R
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3,g=2, b=1, stretch ="lin")
plotRGB(p224r63_2011, r=4,g=3, b=2, stretch ="lin")
plotRGB(p224r63_2011, r=3,g=4, b=2, stretch ="lin")
plotRGB(p224r63_2011, r=3,g=2, b=4, stretch ="lin")
dev.off()

#Stretch "hist" -> histogram, stretchiamo più al centro
plotRGB(p224r63_2011, r=3,g=4, b=2, stretch ="hist")

#Exercise: Par natural colours, false colours and false colours with histogram stretch
par(mfcol=c(1,3))
plotRGB(p224r63_2011, r=3,g=2, b=1, stretch ="lin")
plotRGB(p224r63_2011, r=3,g=4, b=2, stretch ="lin")
plotRGB(p224r63_2011, r=3,g=4, b=2, stretch ="hist")

#----------31/03/2021-------------------------

#Multitemporal set -> Immagine 1988 della stessa zona
p224r63_1988 <- brick("p224r63_1988_masked.grd")
p224r63_1988

plot(p224r63_2011) #plottiamo le singole bande
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin") #Natural colors
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin") #False colours

#Exercise: Create multiframe with image 1988 and 2011
par(mfrow=c(2,1))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin") #False colours
plotRGB(p224r63_2011, r=4,g=3, b=2, stretch ="lin") #False colours

#Exercise: Create multiframe with image 1988 and 2011 
#left -> 1988
#right -> 2011
#up -> stretch lin
#down -> stretch hist
pdf("multitemp.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin") 
plotRGB(p224r63_2011, r=4,g=3, b=2, stretch ="lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist") 
plotRGB(p224r63_2011, r=4,g=3, b=2, stretch ="hist")
#1988 passaggio graduale foresta - ambiente antropizzato
#2011 passaggio netto foresta - ambiente antropizzato
dev.off()



