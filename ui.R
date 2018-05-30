# ui.R
library(shiny)
library(plotly)
library(shinythemes)
shinyUI(navbarPage(
  theme = shinytheme("slate"),
  "Movie Report",
  tabPanel(
    "Overview",
    h1("Our Project"),
    p("This app utilizies TMDb's API to view data on specific movies and answer questions about a movie's success or possible shortcomings. For this project, we pull in the most recent data available on the date this app is accessed and showcases 20 of the most popular new/upcoming films. We provide information on a movie's finances as well as its popularity, giving the audience a chance to see how much money goes into making a film and how much a film needs to make to be profitable."),
    h1("TMDb's API"),
    p("The data we worked with came from", tags$a(href="https://www.themoviedb.org/documentation/api?language=en", "The Movie Database."), "TMDb is a community built movie and TV database that allowed us to view a movie's budget, revenue, popularity, runtime, etc. Though our project is focused on movies in english, TMDb's database allows anyone to access international movies from", tags$b("all around the world.")),
    h1("Overall Movie Profits"),
    p("Here you may view finances on the most recent/upcoming films. You may view the film's budget, revenue, and profit. Also provided is the movie poster and a short overview of the film's plot"),
    h1("Profits Per Minute"),
    p("This section allows you to visualize how much profit a film has made for every minute of the film's runtime. Because we use the most recent data, some film's may not have an updated revenue report or have yet to break the profit margins.")
    ),
  tabPanel(
    "Overall Movie Profits",
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
          "Movie Runtime (minutes)",
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
    ),
  tabPanel(
    "Last Graph Here"
  )
  )
)
