# ----- 28/04/2021------

library(raster)
library(RStoolbox) # for vegetation indices calculation
#install.packages("rasterdiv")
library(rasterdiv) # for the worldwide NDVI
library(rasterVis)

setwd("C:/lab/")

defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")
# b1= NIR; b2= red; b3=green

par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

# ----- 30/04/2021--------

defor1
# nomi bande defor1.1; defor1.2; defor1.3
dvi1 <- defor1$defor1.1 - defor1$defor1.2
# differenza della riflettanza nell'infrarosso e nel rosso per ogni pixel di ciascuna banda

#dev.off()
plot(dvi1)

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi1, col=cl, main="DVI at time 1")

defor2

dvi2 <- defor2$defor2.1 - defor2$defor2.2
plot(dvi2)
plot(dvi2, col=cl, main="DVI at time 2")

par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI at time 1")
plot(dvi2, col=cl, main="DVI at time 2")

#dev.off()
# Calcolo differenze fra DVI1 e DVI2
difdvi <- dvi1 - dvi2
cld <- colorRampPalette(c('blue','white','red'))(100)
plot(dvi2, col=cld, main="Differenza DVI")

#ndvi
#(NIR-RED)/(NIR+RED)
ndvi1 <- (defor1$defor1.1 - defor1$defor1.2) / (defor1$defor1.1 + defor1$defor1.2)
# numeratore = dvi1
# ndvi1 <- dvi1 / (defor1$defor1.1 + defor1$defor1.2)
plot(ndvi1, col=cl)

ndvi2 <- (defor2$defor2.1 - defor2$defor2.2) / (defor2$defor2.1 + defor2$defor2.2)
plot(ndvi2, col=cl)


difndvi <- ndvi1 - ndvi2

#dev.off()
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difndvi, col=cld)


# RStollbox :: spectralIndices
vi1 <- spectralIndices(defor1, green =3, red =2, nir =1)
plot(vi1, col=cl)
vi2 <- spectralIndices(defor2, green = 3, red = 2, nir = 1)
plot(vi2, col=cl)

#----- 5/05/2021------------

#worldwide NDVI
plot(copNDVI)

# I pixel con valori 253, 254 e 255 (individuano acqua) possono essere settati come un Not a number

copNDVI <- reclassify (copNDVI, cbind(253:255, NA))
# riclassifichiamo l'immagine iniziale copNDVI
# riclassifichiamo i pixel da 253 a 255 (da...a... -> :)
# riclassificati come NA, li eliminiamo
   
plot(copNDVI)

# usiamo la libreria rasterVis
levelplot(copNDVI)

#nella zona dell'equatore si ha il massimo della biomassa



