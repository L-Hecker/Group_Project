# ui.R
library(shiny)
library(plotly)
library(shinythemes)
shinyUI(navbarPage(
  theme = shinytheme("spacelab"),
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
        helpText(
          "Note: All movies are popular upcoming/new releases from today's date.",
          "Some movies have not yet released totals for their budget or revenue."
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
