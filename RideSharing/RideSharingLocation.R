library(leaflet)
library(tidyverse)

rideSharing <- read_csv(choose.files())

timeLocation <- rideSharing %>% 
  mutate(Day = weekdays(timeStamp),
         Date = date(timeStamp),
         Hour = hour(timeStamp)) %>% 
  group_by(Date, Hour) %>% 
  distinct(srcLong, srcLat, destLong, destLat) %>% 
  arrange(Date, Hour) %>% 
  ungroup() %>% 
  complete(Date, Hour) %>% 
  replace(is.na(.), 0)


timeLocation %>% 
  filter(Date == "2017-10-01",
         Hour == 3) %>% 
  leaflet() %>% 
  addTiles() %>% 
  addMarkers(lng = ~srcLong,
             lat = ~srcLat,
             clusterOptions = markerClusterOptions())

