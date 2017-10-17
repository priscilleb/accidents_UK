pourcentage <- function(weather,road,light){
  var <- d1 %>% mutate(total=n()) 
  var <- var %>% 
    filter(Weather_Conditions==weather,Road_Surface_Conditions==road,Light_Conditions==light) %>%
    mutate(prop=n())%>% 
    mutate(res=prop/total) %>% head(1)
  return(round(var$res*100,2))
}