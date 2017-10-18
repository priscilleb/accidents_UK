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
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId="weather",label = "Choose the weather condition :",choices = unique(dataset$Weather_Conditions)),
      selectInput(inputId="road",label = "Choose the road condition:",choices = unique(dataset$Road_Surface_Conditions)),
      selectInput(inputId="light",label = "Choose the light condition:",choices = unique(dataset$Light_Conditions))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput(outputId = "graph"),
      textOutput(outputId="pourcentage")
    )
  )
)


server <- function(input, output) {
  
  n <- reactive(pourcentage(input$weather, input$road,input$light))
  output$pourcentage <- renderPrint({cat("Ces conditions représentent ",as.character(n()),"% du total des accidents")})
  
  output$graph <- renderPlot({draw_with_conditions(input$weather, input$road,input$light)})
}

# Run the application 
shinyApp(ui = ui, server = server)
