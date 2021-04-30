# ----- 28/04/2021------

library(raster)
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
plotRGB(dvi1, cl)
