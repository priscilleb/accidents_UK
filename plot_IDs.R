library(tidyr)
library(leaflet)

plot_IDs <- function(data){
  
  #deal with colors
  getColor <- function(data) {
    sapply(data$Number_of_Vehicles, function(Number_of_Vehicles) {
      if(Number_of_Vehicles <= 1) {
        "green"
      } else if(Number_of_Vehicles <= 2) {
        "orange"
      } else {
        "red"
      } })
  }

  #icons' format
  icons <- awesomeIcons(
    icon = 'ios-close',
    iconColor = 'black',
    library = 'ion',
    markerColor = getColor(data)
  )
  
  #plot
  data %>% leaflet() %>% addTiles() %>%
    addAwesomeMarkers(~Longitude, ~Latitude, icon=icons, label= ~paste("Casualties :", as.character(Number_of_Casualties)), clusterOptions = markerClusterOptions())
}


