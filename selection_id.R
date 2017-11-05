
selection_id <- function(weather,road,light,region){
  return(d1 %>% 
           filter(Weather_Conditions==weather,Road_Surface_Conditions==road,Light_Conditions==light,Region==region) %>%
           pull(Accident_Index)
  )
}

selection_id("Fine without high winds","Dry","Darkness: Street lights present and lit","North West") 


#### TEST ####
#Quand on View, on voit en bas qu'il y a 3701 lignes
d1 %>% 
  filter(Weather_Conditions=="Fine without high winds",Road_Surface_Conditions=="Dry",Light_Conditions=="Darkness: Street lights present and lit",Region=="North West") %>% pull(Accident_Index) %>% 
  View()

#On retrouve bien ici 3701 lignes
d1 %>% 
  filter(Weather_Conditions=="Fine without high winds",Road_Surface_Conditions=="Dry",Light_Conditions=="Darkness: Street lights present and lit",Region=="North West") %>% summarise(count=n())

d1 %>% summarise(count=n()) %>% summary()

