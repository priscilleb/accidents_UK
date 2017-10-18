
selection_id <- function(weather,road,light, region){
  return(d1 %>% 
           filter(Weather_Conditions==weather,Road_Surface_Conditions==road,Light_Conditions==light,Region==region) %>%
           pull(Accident_Index))
}

length(selection_id("Fine without high winds","Dry","Darkness: Street lights present and lit")

