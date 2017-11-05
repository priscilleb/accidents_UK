#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

install.packages("leaflet")
library(shiny)
library(utils)
library(dplyr)
library(tidyverse)
library(leaflet)
library(RColorBrewer)

ui <- fluidPage(
  titlePanel("Accidents in the UK"),
  leafletOutput("mymap", width = "100%", height = 800),
  absolutePanel(top = 10, right = 10, 
                selectInput(inputId="weather",label = "Choose the weather condition :",choices = unique(d1$Weather_Conditions)),
                selectInput(inputId="road",label = "Choose the road condition:",choices = unique(d1$Road_Surface_Conditions)),
                selectInput(inputId="light",label = "Choose the light condition:",choices = unique(d1$Light_Conditions)),
                selectInput(inputId="region",label = "Choose the region:",choices = unique(d1$Region)),
                actionButton("go", "Map the accidents"), 
                textOutput("pourcentage_risque"),
                plotOutput("myplot", height = 200),
              
                draggable = TRUE
  )
)

server <- function(input, output) {
  
  points <- eventReactive(input$go, {
    selection_id(input$weather,input$road,input$light,input$region)
  })
  output$mymap <- renderLeaflet({plot_IDs(points())})
  output$myplot <- renderPlot({draw_with_conditions(input$weather,input$road,input$light,input$region)})
  output$pourcentage_risque <- renderText(paste(pourcentage(input$weather,input$road,input$light,input$region),"% of accidents occurs in these conditions"))
}



# Run the application 
shinyApp(ui = ui, server = server)