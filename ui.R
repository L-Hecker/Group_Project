# ui.R
library(shiny)
library(plotly)
library(shinythemes)
shinyUI(navbarPage(
  theme = shinytheme("slate"),
  "Top Movie Data",
  tabPanel(
    "Movie Profits",
    titlePanel("Earnings"),
    sidebarLayout(
      sidebarPanel(
        tags$h2("Popular movies"),
        selectInput(
          "movie",
          label = "Choose Movie",
          choices = movie_choices
        ),
        
        tags$br()
      ),
      
      mainPanel(
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
