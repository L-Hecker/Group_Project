source("api_keys.R")
library(jsonlite)
library(dplyr)
library(httr)

nyt_base_uri <- "http://api.nytimes.com/svc/movies/v2"
nyt_resource <- "/reviews/all.json"
nyt_uri_full <- paste0(nyt_base_uri, nyt_resource)

query_params <- list(key = nyt_movies_key)
GET(nyt_uri_full, querystring = query_params)
# query_params <- list(key = civic_key, address = selected_address)
# response <- GET(full_uri, query = query_params)
# response_content <- content(response, "text")
# parsed_data <- fromJSON(response_content)