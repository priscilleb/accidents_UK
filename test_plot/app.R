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
library(RColorBrewer)
#dataset <- read.csv("/Users/PriscilleBoissonnet/Documents/R_info/projet/dataset/accidents_2012_to_2014.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(
  #tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
  titlePanel("Accidents in the UK"),
  leafletOutput("mymap", width = "100%", height = 800),
  # Application title
  #leafletOutput("mymap"),
  # Sidebar with a slider input for number of bins 
  #sidebarLayout(
    #sidebarPanel(
  absolutePanel(top = 10, right = 10, 
      selectInput(inputId="weather",label = "Choose the weather condition :",choices = unique(dataset$Weather_Conditions)),
      selectInput(inputId="road",label = "Choose the road condition:",choices = unique(dataset$Road_Surface_Conditions)),
      selectInput(inputId="light",label = "Choose the light condition:",choices = unique(dataset$Light_Conditions)),
      selectInput(inputId="district",label = "Choose the district:",choices = unique(dataset$Local_Authority_.District.)),
      actionButton("go", "New points"), draggable = TRUE
      )
  )


server <- function(input, output) {
  
  points <- eventReactive(input$go, {
     selection_id(input$weather,input$road,input$light,input$district)
   })

  output$mymap <- renderLeaflet({plot_IDs(dataset,points())})
}

# Run the application 
shinyApp(ui = ui, server = server)

