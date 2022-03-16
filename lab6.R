
install.packages("tmap")
install.packages("leaflet")
install.packages("leaflet.extras")
install.packages("scales")
install.packages("htmlwidgets")
install.packages("sf")
install.packages("dplyr")
library(raster)
library(rgdal)
library(RColorBrewer)
library(dplyr)
library("tmap")
library("scales")
library("leaflet")
library("sf")
library("leaflet.extras") #Needed for interactive map

options(stringsAsFactors = FALSE)

IRLpops <- "./maps/IRCountyPop.csv"
irlADM <- "./maps/IRL_adm"

ogrListLayers(dsn=irlADM)



IREgeo <-readOGR(irlADM,layer="IRL_adm0")
IREgeo2 <-readOGR(irlADM,layer="IRL_adm1")

IREgeo$STATEFP
IREgeo$NAME

IREgeo <-readOGR(irlADM,layer="IRCountyPop.csv") #

qtm(IREgeo)

qtm(IREgeo,  text="NAME")


IREgeo@data$Province <- sapply(IREgeo@data$County, switch, 
                              
                              'Carlow' = 'Leinster',
                              'Cavan' = 'Ulster',
                              'Clare' = 'Munster',
                              'Cork' = 'Munster',
                              'Donegal' = 'Ulster',
                              'Dublin' = 'Leinster',
                              'Galway' = 'Connaught',
                              'Kerry' =  'Munster',
                              'Kildare' = 'Leinster',
                              'Kilkenny' = 'Leinster',
                              'Laoighis' = 'Leinster',
                              'Leitrim' = 'Connaught',
                              'Limerick' =  'Munster',
                              'Longford' = 'Leinster',
                              'Louth' = 'Leinster',
                              'Mayo' = 'Connaught',
                              'Meath' = 'Leinster',
                              'Monaghan' = 'Ulster',
                              'Offaly' = 'Leinster',
                              'Roscommon' = 'Connaught',
                              'Sligo' = 'Connaught',
                              'Tipperary' =  'Munster',
                              'Waterford' =  'Munster',
                              'Westmeath' = 'Leinster',
                              'Wexford' = 'Leinster',
                              'Wicklow' = 'Leinster')


str(IREgeo@data)





