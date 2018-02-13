ptm=proc.time() #start time 
B16DOSSIER <- read.csv("B16_DOSSIER_DATA_TABLE.csv") # download from OPI server
proc.time()-ptm #160 secondes 
format(object.size(B16DOSSIER),"Mb") #"676.8 Mb"



##%######################################################%##
#                                                          #
####                    FF PACKAGE                      ####
#                                                          #
##%######################################################%##

#préciser la direction des ff files
options(fftempdir = "~/rgit/BigData exemples/")
library(ffbase)
library(ff)
ptm=proc.time()
DOSSIER.ff=read.csv.ffdf(file="B16_DOSSIER_DATA_TABLE.csv",VERBOSE=TRUE,first.rows=-1,header=T) 
proc.time()-ptm #140 secondes
format(object.size(DOSSIER.ff),"Mb") #496.2 Mb



#chaque variable dans un fichier 7 variable ==> 7 fichers ff
list.files(path="~/rgit/BigData exemples/")
#save file
save.ffdf("DOSSIER.ff",dir="saved_DOSSIER.ff")


#Remove and then load it 
rm(list=ls())
gc()
ptm=proc.time()
load.ffdf("~/rgit/BigData exemples/saved_DOSSIER.ff")
proc.time()-ptm  #3 secondes
dossier=as.data.frame(DOSSIER.ff)

##%######################################################%##
#                                                          #
####                 data.table package                 ####
#                                                          #
##%######################################################%##
ptm=proc.time()
DOSSIER.dt=fread("B16_DOSSIER_DATA_TABLE.csv",stringsAsFactors=TRUE)
proc.time()-ptm 
format(object.size(DOSSIER.dt),"Mb") #








##%######################################################%##
#                                                          #
####                 BIG MEMORY PACKAGE                 ####
#                                                          #
##%######################################################%##


