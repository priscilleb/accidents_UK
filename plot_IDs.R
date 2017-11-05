library(tidyr)
library(leaflet)

plot_IDs <- function(dataset,IDs){
  #select the good IDs
  data <- dataset %>% 
    filter(Accident_Index %in% IDs)
  
  
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

#example 
# test <- dataset %>% head() %>%  select(Accident_Index) %>% pull()
# plot_IDs(dataset, test)


### Regarde je pense que le problème vient d'ici :  le count ressort zéro
I <- selection_id("Fine without high winds","Dry","Darkness: Street lights present and lit","North West")
dataset %>% filter(Accident_Index %in% I) %>% summarise(count=n())
