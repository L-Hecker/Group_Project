# ui.R
library(shiny)
library(plotly)
library(shinythemes)
shinyUI(navbarPage(
  theme = shinytheme("slate"),
  "Movie Report",
  tabPanel(
    "Movie Profits",
    sidebarLayout(
      sidebarPanel(
        selectInput(
          "movie",
          label = "Choose Movie",
          choices = movie_choices
        ),
       htmlOutput("img1"),
        tags$br(),
       HTML("<strong>Story Line: </strong>"),
                  htmlOutput("overview")
                
      ),
      
      mainPanel(column(8, align="center"),
        plotlyOutput("bar")
      )
    )
  ),
  tabPanel(
    "Population",
    titlePanel("State Population By Race"),
    # Create sidebar layout
    sidebarLayout(
      sidebarPanel(
        selectInput(
          "location",
          label = "Choose State",
          choices = list(
            "Illinois" = "IL",
            "Indiana" = "IN",
            "Michigan" = "MI",
            "Ohio" = "OH",
            "Wisconsin" = "WI"
          )
        ),
        
        tags$br()
      ),
      
      mainPanel(
        plotlyOutput("")
      )
    )
  )
))
