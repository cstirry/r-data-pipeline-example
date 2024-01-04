# main.R

# Load required libraries
library(roxygen2)
library(httr)
library(jsonlite)
library(dplyr)
library(validate)

# Load helper functions
source("helpers.R")

# Execute data pipeline
tryCatch({

  # API URL for data
  api_url <- "https://services1.arcgis.com/UWYHeuuJISiGmgXx/arcgis/rest/services/PublicArtInventory/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson"

  # Fetch data from API
  api_data <- fetch_and_convert_data(api_url)

  # Convert to a data frame
  api_df <- as.data.frame(api_data)

  # Validate data
  rules <- validator(.file = "validation_rules.yml")
  out <- confront(api_df, rules)

  # Print validation result
  summary(out)
  plot(out)

  # Process data
  result <- count_records_by_zipcode(api_df)

  # Print Number of Public Artworks by Zipcode
  print(result)

}, error = function(err) {
  cat("Data pipeline failed:", err$message, "\n")
})