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

# dataset %>% head(100) %>% leaflet() %>% addTiles() %>% addMarkers(~Longitude, ~Latitude, label= paste("Casualties :",~as.character(Number_of_Casualties)), clusterOptions = markerClusterOptions()
# )

#example 
test <- dataset %>%  select(Accident_Index) %>% pull()
data <- dataset %>% 
  filter(Accident_Index %in% test)
plot_IDs(dataset, test)
#leaflet(data = data) %>% addTiles()%>% addMarkers(data$Longitude, data$Latitude, label = as.character(data$Accident_Severity))
