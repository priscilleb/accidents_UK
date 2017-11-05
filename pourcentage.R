#Fonction qui calcule quel pourcentage des accidents totaux est concerné par les conditions renseignées

pourcentage <- function(weather,road,light,region){
  var <- d1 %>% mutate(total=n()) 
  var <- var %>% 
    filter(Weather_Conditions==weather,Road_Surface_Conditions==road,Light_Conditions==light, Region==region) %>%
    mutate(prop=n())%>% 
    mutate(res=prop/total) %>% head(1)
  return(round(var$res*100,2))
}
