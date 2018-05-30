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

      mainPanel(
        plotlyOutput("bar")
      )
    )
  ),
  tabPanel(
    "Profit Per Minute",
    # Create sidebar layout
    sidebarLayout(
      sidebarPanel(
        sliderInput(
          "amount",
          "USD/Minute",
          min = minimum,
          max = maximum,
          value = average
          )
        ),

        tags$br()
      ),

      mainPanel(
        plotlyOutput("scatter")
      )
    )
  )
)
