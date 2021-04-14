#------- 14/04/2021---------

# Visualizing Copernicus data -> Water soil index 6/04/2021

#install.packages("ncdf4")
library(raster)
library(ncdf4)

setwd("C:/lab/")

soilwaterindex <- raster("soilwaterindex.nc")
soilwaterindex

cl <- colorRampPalette(c('light green','yellow', 'light red', 'blue'))(100)
plot(soilwaterindex, col=cl)

# Resampling (Ricampionamento)

# Ridurre qualità immagine (diminuire dimensione pixel)
#fact=10 -> riduco di un fattore 10, cioè ottengo 1 nuovo pixel ogni 10x10 pixel
soilwaterindexres <- aggregate(soilwaterindex, fact=100)
plot(soilwaterindexres, col=cl)

