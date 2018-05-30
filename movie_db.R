### install.packages("TMDb") ###


# ^^^ install if you haven't already, very helpful

library(TMDb)
# Library TMBd allows you to use functions that interact with the TMBd API
library(httr)
library(jsonlite)
library(dplyr)
library(lubridate)
library(data.table)




# https://developers.themoviedb.org/3/getting-started

source("api_keys.R")

### Get top movies from today's date and make data frame ###

movie_stuff <- as.data.frame(discover_movie(
  api_key = movie_db_key, certification_country = "US",
  certification.lte = 16, primary_release_year = format(Sys.Date(), "%Y")
))

### Seperate movie ID's to try and get revenue and budget ###

# Create a list of movie ID's
id_list <- movie_stuff %>%
  select(results.id)

# Create a function that calls movie info for budget/revenue for each ID
get_data <- function(x) {
  id <- x[1]
  movie(movie_db_key, id)
}

# Create a list of all the movie ID's and their addition info

### NOTE: ERROR 429 here, requesting too much data for the server to handle ###
### works when we run each line of code individually after getting the error ###

revenue_info <- apply(id_list, 1, get_data)

# Turn nested list into workable dataframe
revenue_df <- data.frame(t(sapply(revenue_info, c)),
                         stringsAsFactors = FALSE) %>%
  select(
    title, overview, budget, release_date,
    revenue, runtime, popularity, homepage, poster_path, vote_average,
    vote_count
  )

### CREATE NEW COLUMN WITH EARNINGS

revenue_df$earnings <- ifelse((as.numeric(revenue_df$revenue) -
  as.numeric(revenue_df$budget)) < 0, 0,
as.numeric(revenue_df$revenue)
- as.numeric(revenue_df$budget)
)

# set up pictures to be shown in app

revenue_df$poster_path <- shQuote(paste0("https://image.tmdb.org/t/p/w500",
                                         revenue_df$poster_path), type = "cmd")

# create a list of choices for shiny

movie_choices <- as.list(revenue_df$title, all.names = TRUE)
names(movie_choices) <- revenue_df$title

# Find earnings per minute
revenue_df <- revenue_df %>% 
  mutate(profit_per_minute = as.numeric(earnings)/as.numeric(runtime))

minimum <- min(as.numeric(revenue_df$runtime))
maximum <- max(as.numeric(revenue_df$runtime))
average <- mean(as.numeric(revenue_df$runtime))

revenue_df$title <- as.character(revenue_df$title)
revenue_df$popularity <- as.numeric(revenue_df$popularity)
revenue_df$profit_per_minute <- as.numeric(revenue_df$profit_per_minute)
revenue_df$runtime <- as.numeric(revenue_df$runtime)
revenue_df$vote_average <- as.numeric(revenue_df$vote_average)
