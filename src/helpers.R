# helpers.R

#' @title Helper Function: Fetch Data from ArcGIS API
#' @description Fetch data from the ArcGIS API using the httr library.
#' @param api_url The URL of the ArcGIS API.
#' @import httr
#' @import jsonlite
#' @return A data frame representing the fetched data.
fetch_and_convert_data <- function(api_url) {
  # Fetch data from API
  response <- httr::GET(api_url)

  # Check if the request was successful
  if (httr::http_status(response)$category == "Success") {
    # Parse JSON content
    json_data <- httr::content(response, "text")

    # Convert JSON to a data frame
    data <- jsonlite::fromJSON(json_data, flatten = TRUE)

    return(data)
  } else {
    # Handle API request failure
    stop("API request failed. Status code: ", httr::http_status(response)$status_code)
  }
}

#' @title Helper Function: Count Records by Zipcode
#' @description Counts the number of records for each unique zipcode in a dataframe with nested structure.
#' @param data The dataframe with nested structure (e.g., features.properties.zipcodes).
#' @return A data frame with the count of records for each unique zipcode.
#' @import dplyr
count_records_by_zipcode <- function(data) {

  result <- data %>%
    dplyr::select(features.properties.zipcodes) %>%
    dplyr::group_by(features.properties.zipcodes) %>%
    dplyr::summarise(record_count = dplyr::n())

  return(result)
}
