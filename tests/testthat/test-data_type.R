library(testthat)
library(tidyverse)
library(prepR)

test_that("data_type correctly separates categorical and numeric", {
  test_df <- tibble(cat1 = c("apple", "pear"), cat2 = c(TRUE, FALSE), num1 = c(1L, 2L), num2 = c(2, 3.4))

  expect_identical(data_type(test_df)$num, test_df %>% select(num1, num2))
  expect_identical(data_type(test_df)$cat, test_df %>% select(cat1, cat2))
})

test_that("data_type correctly captures input error", {
  expect_error(data_type("test_df")$num, "Please provide a valid data.frame object")
  expect_error(data_type(tibble())$num, "Please provide a non-empty data.frame object")
})
