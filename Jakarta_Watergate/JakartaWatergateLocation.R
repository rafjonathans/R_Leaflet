
library(leaflet)
library(tidyverse)

datajkt <- read.csv(choose.files())

watergate <- distinct(datajkt[,1:4])

watergate %>% 
  leaflet() %>% 
  addTiles() %>% 
  addMarkers(lng = ~longitude,
             lat = ~latitude, 
             label = ~nama_pintu_air,
             clusterOptions = markerClusterOptions())
