# ---------16/04/2021--------

# R_code_knitr.r -> COME CREARE UN REPORT CON R

setwd("C:/lab/")

#knitr prende un codice esterno e all'interno di r genera report salvato nella stessa cartella in cui ho il codice

require(knitr) #require=library

# tinytex::install_tinytex()
# tinytex::tlmgr_update()

# stitch genera report automaticamente partendo da uno script r
# 1° argomento = file di testo dello script r
# 2° argomento = template
stitch("R_code_time_series.r", template=system.file("misc", "knitr-template.Rnw", package="knitr"))
