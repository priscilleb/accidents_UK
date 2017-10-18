draw_with_conditions <- function(weather,road,light){
  d1 %>% filter(Weather_Conditions==weather,Road_Surface_Conditions==road,Light_Conditions==light) %>% 
    group_by(Day_of_Week) %>% summarise(count=n()) %>% ggplot(aes(x=Day_of_Week,y=count))+geom_col()
}



#draw_with_conditions("Fine without high winds","Dry","Darkness: Street lights present and lit")

