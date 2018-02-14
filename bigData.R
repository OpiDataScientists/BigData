ptm=proc.time() #start time 
B16DOSSIER <- read.csv("B16_DOSSIER_DATA_TABLE.csv") # download from OPI server
proc.time()-ptm #140 secondes 
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
library(data.table)
ptm=proc.time()
DOSSIER.dt=fread("B16_DOSSIER_DATA_TABLE.csv",stringsAsFactors=TRUE)
proc.time()-ptm 
format(object.size(DOSSIER.dt),"Mb") # "676.8 Mb"


##%######################################################%##
#                                                          #
####                     spark H2O                      ####
#                                                          #
##%######################################################%##

library(spark)
library(sparklyr)
 #spark_install(version = "2.2.0", hadoop_version = "2.6")
 #devtools::install_github("h2oai/rsparkling", ref = "master")
 #install.packages("h2o", type = "source",repos = "https://h2o-release.s3.amazonaws.com/h2o/rel-weierstrass/2/R")
library(rsparkling)
 
library(SparkR)
 library(dplyr)
 sc <- spark_connect(master = "local", version = "2.2.0")
  library(h2o)
 h2o.init()
 DOSSIER.hex = h2o.importFile(path = "B16_DOSSIER_DATA_TABLE.csv",destination_frame = "DOSSIER.hex")
 h2o.ls() #to check
 h2o.clusterInfo() #info
 colnames(DOSSIER.hex)
 
##%######################################################%##
#                                                          #
####                 BIG MEMORY PACKAGE                 ####
#                                                          #
##%######################################################%##


