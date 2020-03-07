library(testthat)
library(PrepR)

# Helper data
fruits <- data.frame(species = c("apple", "grape", "pear", "banana"))
fruits$species <- as.factor(fruits$species)

output = onehot(fruits)

test_that("Length of input and output should be equal (same number of rows)", {
  expect_equal(length(fruits[[1]]), length(output[[1]]))
})

test_that("There should not be more than 10 unique values", {
  expect_error(onehot(mtcars[1]))
})

test_that("Number of columns in output should be equal to number of unique values in input column",{
  output <- onehot(fruits)
  expect_equal(length(fruits[[1]]), length(output))
})

test_that("Each row should add up to 1", {
  for (i in 1:nrow(output)) {
    expect_equal(sum(output[i,]), 1)}
})
