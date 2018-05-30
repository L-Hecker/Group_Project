# ui.R
library(shiny)
library(plotly)
library(shinythemes)
source("movie_summary.R")

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
    "Overview",
    titlePanel("Film Description"),
    sidebarLayout(
      sidebarPanel(
        selectInput(
          "film",
          label = "Choose Film",
          choices = movie_choices
        )
      ),
      mainPanel(
        htmlOutput("poster"),
        h4("Overview"),
        h5(textOutput("description")),
        h5(textOutput("genre"))
      )
    )
  )
  # tabPanel(
  #   "Overview",
  #   titlePanel("Film Description"),
  #   sidebarLayout(
  #     sidebarPanel(
  #       selectInput(
  #         "film",
  #         label = "Choose Film",
  #         choices = movie_choices
  #       )
  #     ),
  #     # htmlOutput("img1"),
  #     #   tags$br()
  #     mainPanel(
  #       htmlOutput("img1"),
  #       tags$br()
  #     )
  #   )
  # )
))
