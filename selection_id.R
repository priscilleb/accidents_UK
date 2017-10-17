selection_id <- function(weather,road,light){
  return(dataset %>% 
           filter(Weather_Conditions==weather,Road_Surface_Conditions==road,Light_Conditions==light) %>%
           pull(Accident_Index))
}

selection_id("Fine without high winds","Dry","Darkness: Street lights present and lit")