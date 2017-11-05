library(utils)
library(dplyr)
library(tidyverse)
library(ggplot2)
dataset <- read.csv("accidents_2012_to_2014.csv")

#On selectionne seulement les attributs qui nous intéressent et on réarrange les formats
d1 <- dataset %>% select("Accident_Index","Road_Surface_Conditions","Weather_Conditions","Light_Conditions","Day_of_Week","Local_Authority_.District.","Longitude","Latitude")
d1$Day_of_Week <- as.factor(d1$Day_of_Week)
levels(d1$Day_of_Week) <- c("Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche")
d1 <- d1 %>% rename("District"= Local_Authority_.District.)

#Traitement d'une deuxième base de données Region qui relie à chaque district sa région
region <- read.csv("Local_Authority_District_to_Region_December_2016_Lookup_in_England.csv")
region <- region %>% rename("District" = FID)
region <- region %>% rename("Region" = RGN16NM)
region <- region %>% select(District, Region)

#On joint les deux bases de données pour connaitre pour chaque observation la région
d1 <- d1 %>% left_join(region, by="District")
d1 <- d1 %>% filter(Region != "NA") %>% select(-District)


