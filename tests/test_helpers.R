# tests/test_helpers.R

# Load required libraries
library(testthat)

# Load helper functions
source("src/helpers.R")

# Unit tests
test_that("count_records_by_zipcode works", {

  input_df <- data.frame(
    features.properties.zipcodes = c("21211", "21211", "21212")
  )

  expected_output_df <- data.frame(
    features.properties.zipcodes = c("21211", "21212"),
    record_count = c(2, 1)
  )

  result_df <- count_records_by_zipcode(input_df)
  expect_equal(result_df, expected_output_df, check.attributes = FALSE)
}
)
