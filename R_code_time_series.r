#--------- 31/03/2021------------
# Monitoraggio variazione delle temperature in Groenlandia
# Data and code from Emanuela Cosma

# install.packages("raster")
# install.packages("rasterVis")

library(raster)
library(rasterVis) #Metodi di visualizzazione per dati raster

setwd("C:/lab/Greenland") 

#--------- 7/04/2021------------

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
# import = OGGETTO!

#stack
TGr <- stack (import)
#stack permette di creare unico blocco di file raster partendo da una lista
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

#--------- 9/04/2021--------------

#levelplot plottiamo l'intero blocco di file con un'unica legenda, coordinate non ripetute per ogni immagine e gamma colori più ampia
levelplot(TGr)

levelplot(TGr$lst_2000)
# stampa unica immagine con due grafici riportanti rispettivamente:
# la media dei valori di ogni pixel per ogni colonna
# la media dei valori di ogni pixel per ogni riga

cl <- colorRampPalette(c("blue","light blue","light green","green"))(200)
levelplot(TGr, col.regions=cl)
#plot con nuovi colori 
#-> il colore blu scuro (Temperatura minore) si degrada (incremento di Temperatura nel 2015)

#Cambio titolo delle immagini
# ATTRIBUTI = attr -> lst_2000 è un attributo!
levelplot(TGr, col.regions=cl, main="LST variation in time",
          names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))
#names.attr -> cambia titolo a ciascun attributo creando un vettore dei nuovi titoli (stringa ")
#main -> cambia il titolo del blocco di immagini

# Melt
# Esercizio: Fare lista di file melt, applicare lapply, fare levelplot

meltlist <- list.files(pattern="melt")
melt_import <- lapply(meltlist, raster)
melt_greenland <- stack (melt_import)
melt_greenland

levelplot(melt_greenland)
#osserviamo lo sciogliemento effettivo dei ghiacciai nella nostra area

# Quanto ghiaccio si è sciolto dal 1979 al 2007?
melt_amount <- melt_greenland$X2007annual_melt - melt_greenland$X1979annual_melt
#Importante legare il nome del file al blocco di appartenenza!!!
clb <- colorRampPalette(c("green","white","red"))(200)
plot(melt_amount, col=clb)
# in rosso valori più alti
melt_amount #visualizzazione valori max e min

levelplot(melt_amount, col.regions=clb) #picco di scioglimento su colonna Ovest




