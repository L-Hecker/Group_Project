source("api_keys.R")
library(jsonlite)
library(dplyr)
library(httr)

nyt_base_uri <- "http://api.nytimes.com/svc/movies/v2"
nyt_resource <- "/reviews/all.json"
nyt_uri_full <- paste0(nyt_base_uri, nyt_resource)

query_params <- list("api-key" = nyt_movies_key)
body <- GET(nyt_uri_full, query = query_params)
body_content <- fromJSON(content(body, "text"))
flattened <- flatten(body_content$results)
# query_params <- list(key = civic_key, address = selected_address)
# response <- GET(full_uri, query = query_params)
# response_content <- content(response, "text")
# parsed_data <- fromJSON(response_content)

fandango_uri <- "http://api.fandango.com/v1?op="
nyt_resource <- ""
# operation
# parameter list
# apikey and sig
"<operation>&<parameter list>&apikey=<apikey>&sig=<sig>"