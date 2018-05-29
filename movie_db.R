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
# get_revenue <- "&sory_by=revenue.desc"
# base_uri <- "https://api.themoviedb.org/3/discover/movie?api_key="
# resource <- "&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&"
# query_params <- list("api_key" = movie_db_key, primary_release_year = "2017")
# response <- GET(paste0(base_uri, resource, get_revenue), query = query_params)
# body <- fromJSON(content(response, "text"))
# stuff <- flatten(body$results)

### ^^^ This was all before I found out there was a library for TMDb ###

### Get top movies from today's date and make data frame ###

movie_stuff <- discover_movie(api_key = movie_db_key, certification_country = "US",
                              certification.lte = 16, primary_release_year = format(Sys.Date(), "%Y"))
movie_df <- as.data.frame(movie_stuff$results)

### Seperate movie ID's to try and get revenue and budget ###

# Create a list of movie ID's 
id_list <- movie_df %>% 
  select(id)

# Create a function that calls movie info for budget/revenue for each ID
get_data <- function(x) {
  id = x[1]
  movie(movie_db_key, id)
}

# Create a list of all the movie ID's and their addition info
revenue_info <- apply(id_list, 1, get_data)

# Turn list into data frame somehow by accessing each individual list for the movies

# unlist data? and make into data frame?
revenue_df <- data.frame(t(sapply(revenue_info,c))) %>% 
  select(title, overview, budget,release_date,
         revenue, runtime, homepage, poster_path)
