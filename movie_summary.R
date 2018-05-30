library(TMDb)
# install.packages('DT')
library(DT)
library(dplyr)

source("api_keys.R")

# colnames: results.title, results.vote_average, results.release_date,
# results.overview, results.genre_ids


# Search Movies
movie_id <- function(x) {
  search_movie(api_key = movie_db_key, x)$id
}

# General Info
movie_data <- movie(api_key = movie_db_key, id = 383498)

# Credits
credits <- as.data.frame(movie_credits(api_key = movie_db_key, id = 383498)$cast)
credits_actors <- filter(select(credits, name, character)[1:6,])

# Genre
genre <- function(x) {
  movie_data <- movie(api_key = movie_db_key, id = x)
}

# Overview
overview <- movie_data$overview

# Poster
poster <- paste0("http://image.tmdb.org/t/p/", movie_data$poster_path)

# Release Date
release_date <- movie_data$release_date

# Box Office
revenue <- movie_data$revenue

# Runtime
runtime <- movie_data$runtime

# Title
title <- movie_data$title

# Rating
vote_average <- movie_data$vote_average










