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
    
    output$img1 <- renderText ({   #This is where the image is set 
      if(input$movie == revenue_df$title[1]){            
        c("<img src=", revenue_df$poster_path[1], "height='500' width='390' >")
      } 
      else if(input$movie == revenue_df$title[2]){
        c("<img src=", revenue_df$poster_path[2], "height='500' width='390' >")
      }
      else if(input$movie == revenue_df$title[3]){
        c("<img src=", revenue_df$poster_path[3], "height='500' width='390' >")
      } 
      else if(input$movie == revenue_df$title[4]){
        c("<img src=", revenue_df$poster_path[4], "height='500' width='390' >")
      }
      else if(input$movie == revenue_df$title[5]){
        c("<img src=", revenue_df$poster_path[5], "height='500' width='390' >")
      }
      else if(input$movie == revenue_df$title[6]){
        c("<img src=", revenue_df$poster_path[6], "height='500' width='390' >")
      }  
      else if(input$movie == revenue_df$title[7]){
        c("<img src=", revenue_df$poster_path[7], "height='500' width='390' >")
      }  
      else if(input$movie == revenue_df$title[7]){
        c("<img src=", revenue_df$poster_path[7], "height='500' width='390' >")
      }  
      else if(input$movie == revenue_df$title[7]){
        c("<img src=", revenue_df$poster_path[7], "height='500' width='390' >")
      }  
      else if(input$movie == revenue_df$title[8]){
        c("<img src=", revenue_df$poster_path[8], "height='500' width='390' >")
      }  
      else if(input$movie == revenue_df$title[9]){
        c("<img src=", revenue_df$poster_path[9], "height='500' width='390' >")
      }  
      else if(input$movie == revenue_df$title[10]){
        c("<img src=", revenue_df$poster_path[10], "height='500' width='390' >")
      }
      else if(input$movie == revenue_df$title[11]){
        c("<img src=", revenue_df$poster_path[11], "height='500' width='390' >")
      }  
      else if(input$movie == revenue_df$title[12]){
        c("<img src=", revenue_df$poster_path[12], "height='500' width='390' >")
      }  
      else if(input$movie == revenue_df$title[13]){
        c("<img src=", revenue_df$poster_path[13], "height='500' width='390' >")
      }  
      else if(input$movie == revenue_df$title[14]){
        c("<img src=", revenue_df$poster_path[14], "height='500' width='390' >")
      }  
      else if(input$movie == revenue_df$title[15]){
        c("<img src=", revenue_df$poster_path[15], "height='500' width='390' >")
      }  
      else if(input$movie == revenue_df$title[16]){
        c("<img src=", revenue_df$poster_path[16], "height='500' width='390' >")
      }  
      else if(input$movie == revenue_df$title[17]){
        c("<img src=", revenue_df$poster_path[17], "height='500' width='390' >")
      }  
      else if(input$movie == revenue_df$title[18]){
        c("<img src=", revenue_df$poster_path[18], "height='500' width='390' >")
      }
      else if(input$movie == revenue_df$title[19]){
        c("<img src=", revenue_df$poster_path[19], "height='500' width='390' >")
      }  
      else if(input$movie == revenue_df$title[20]){
        c("<img src=", revenue_df$poster_path[20], "height='500' width='390' >")
      }  
    })
})