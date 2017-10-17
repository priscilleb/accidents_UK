#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(utils)
library(dplyr)
library(tidyverse)
library(leaflet)
#dataset <- read.csv("/Users/PriscilleBoissonnet/Documents/R_info/projet/dataset/accidents_2012_to_2014.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(
  # Application title
  titlePanel("Accidents in UK"),
  leafletOutput("mymap"),
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId="weather",label = "Choose the weather condition :",choices = unique(dataset$Weather_Conditions)),
      selectInput(inputId="road",label = "Choose the road condition:",choices = unique(dataset$Road_Surface_Conditions)),
      selectInput(inputId="light",label = "Choose the light condition:",choices = unique(dataset$Light_Conditions))
    ),
    actionButton("go", "New points")
  )
)


server <- function(input, output) {
   points <- eventReactive(input$go, {
     selection_id(input$weather,input$road,input$light)
   }, ignoreNULL = FALSE)

  output$mymap <- renderLeaflet({plot_IDs(dataset,test)})

}

# Run the application 
shinyApp(ui = ui, server = server)

