library(utils)
library(dplyr)
library(tidyverse)
library(ggplot2)
dataset <- read.csv("accidents_2012_to_2014.csv")


d1 <- dataset %>% select("Accident_Index","Road_Surface_Conditions","Weather_Conditions","Light_Conditions","Day_of_Week","Local_Authority_.District.")
d1$Day_of_Week <- as.factor(d1$Day_of_Week)
levels(d1$Day_of_Week) <- c("Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche")
d1 <- d1 %>% rename("District"= Local_Authority_.District.)

region <- read.csv("Local_Authority_District_to_Region_December_2016_Lookup_in_England.csv")
region <- region %>% rename("District" = FID)
region <- region %>% rename("Region" = RGN16NM)
region <- region %>% select(District, Region)

d1 <- d1 %>% left_join(region, by="District")
d1 <- d1 %>% filter(Region != "NA") %>% select(-District)
