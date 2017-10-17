library(utils)
library(dplyr)
library(tidyverse)
library(ggplot2)
dataset <- read.csv("accidents_2012_to_2014.csv")


d1 <- dataset %>% select("Accident_Index","Road_Surface_Conditions","Weather_Conditions","Light_Conditions","Day_of_Week")
d1$Day_of_Week <- as.factor(d1$Day_of_Week)
levels(d1$Day_of_Week) <- c("Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche")