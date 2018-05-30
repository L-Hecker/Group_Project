# server.R
library(dplyr)

# Read in data
source("./scripts/budget_bar.R")

# Start shinyServer
shinyServer(function(input, output) {
  
  # Render a plotly object that returns your map
  output$bar <- renderPlotly({
    budget_bar(revenue_df, input$movie)
  })
})