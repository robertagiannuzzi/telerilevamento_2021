#-------- 21/04/2021 ---------
# R_code_classification.r

library(raster)
library(RStoolbox)

setwd("C:/lab/") 

# Analizziamo l'immagine di una parte all'interno del sole

so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

so
#visualize RGB levels
plotRGB(so, 1, 2, 3, stretch="lin") # plotta immagine così come l'abbiamo scaricata

# CLASSIFICAZIONE NON SUPERVISIONATA UNA IMMAGINE
# si lascia al software la scelta dei training set

# 1° argomento = immagine
# 2° argomento = numero di campioni/pixel
# 3° argomento = quante classi vogliamo fare

soc <- unsuperClass(so, nClasses= 3)
# Suddivisione in classi in base al valore di riflettanza di ciascun pixel
# partendo da due punti random

# soc formato dal modello e dalla mappa
# plot solo della mappa:
plot(soc$map)

# set.seed() permette di usare sempre le stesse repliche in plot diversi

# ESERCIZIO 
# Unsupervised Classification with 20 classes

socr <- unsuperClass(so, nClasses= 20)
plot(socr$map)

#Download an image from:
#https://www.esa.int/ESA_Multimedia/Missions/Solar_Orbiter/(result_type)/images

#Unsupervised Classification
sun <- brick("The_many_faces_of_the_Sun_from_Solar_Orbiter_s_EUI_and_PHI_instruments_pillars.jpg")
sunc <- unsuperClass(sun, nClasses= 3)
plot(sunc$map)

# Download Solar Orbiter data and proceed further!

#------ 23/04/2021---------

# Grand Canyon
# Link Immagine: https://landsat.visibleearth.nasa.gov/view.php?id=80948

gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
gc

plotRGB(gc, r=1, g=2, b=3, stretch="lin")
plotRGB(gc, r=1, g=2, b=3, stretch="hist")
# con histogram sono evidenziate le zone d'ombra (possibile litologia differente)

gcc2 <- unsuperClass(gc, nClasses= 2)
plot(gcc2$map)

gcc4 <- unsuperClass(gc, nClasses= 4)
plot(gcc4$map)
 

