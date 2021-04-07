#--------- 31/03/2021------------
# Monitoraggio variazione delle temperature in Groenlandia
# Data and code from Emanuela Cosma

# install.packages("raster")
# install.packages("rasterVis")

library(raster)

setwd("C:/lab/Greenland") 

# 1° Metodo
lst_2000 <- raster("lst_2000.tif")
#funzione raster (del pacchetto raster) serve per caricare dei singoli dati
#usciamo da r -> usare virgolette "
plot(lst_2000)
lst_2005 <- raster("lst_2005.tif")
plot(lst_2005)
lst_2010 <- raster("lst_2010.tif")
plot(lst_2010)
lst_2015 <- raster("lst_2015.tif")
plot(lst_2015)

#uniamo i file in un multiframe
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# 2° Metodo
#list of files
list.files()

#list.files permette di creare lista di file
#pattern cerca i file che ci interessano attraverso il loro nome
# -> es. i nostri file hanno in comune nei loro nomi "lst"
rlist <- list.files(pattern="lst")
rlist #visulizza lista creata

#lapply
import <- lapply(rlist, raster)
#lapply permette di applicare ad una lista di file una stessa funzione 
# -> es. nel nostro caso la funzione raster 
# 1° argomento = lista
# 2° argomento = funzione
import 

#stack
TGr <- stack (import)
#stack permette di creare gruppo di file raster partendo da una lista
plot(TGr)

# il secondo è il metodo più veloce

plotRGB(TGr, 1,2,3, stretch="lin")
# 1° livello lst_2000 -> red
# 2° livello lst_2005 -> green
# 3° livello lst_2010 -> blue

plotRGB(TGr, 2,3,4,  stretch="lin")
# 1° livello lst_2005 -> red
# 2° livello lst_2010 -> green
# 3° livello lst_2015 -> blue
#dove la mappa è blu vuol dire che ho valori più alti nel 2015
