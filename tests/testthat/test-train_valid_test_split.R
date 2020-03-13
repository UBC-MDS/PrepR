library(testthat)
library(PrepR)

context('train_valid_test_split')

#' This script will test the output of the train_valid_test_split function
#' which splits feature and target data frames into random train, validation and test subsets
#'
#' The proportion of the train set relative to the input data will be valid_size * (1 - test_size)
#'
#' author: George Thio
#' date: Mar 7, 2020
#'
#' Test output of default values
#'

test_that('Test length of output data sets are correct based on default values', {

  x = data.frame('X1'=c(0,1,2,3,4,5,6,7),
                 'X2'=c(8,9,10,11,12,13,14,15))

  y = data.frame('Y'=c(0,1,2,3,4,5,6,7))

  output = train_valid_test_split(x,y)

  expect_true(dim(output$x_train)[1] == 4)
  expect_true(dim(output$x_valid)[1] == 2)
  expect_true(dim(output$x_test)[1] == 2)
  expect_true(dim(output$y_train)[1] == 4)
  expect_true(dim(output$y_valid)[1] == 2)
  expect_true(dim(output$y_test)[1] == 2)
})

test_that("train_valid_test_split captures x input data type error", {
  x = list(0,1,2,3,4,5,6,7)
  y = data.frame('Y'=c(0,1,2,3,4,5,6,7))
  expect_error(train_valid_test_split(x, y) , "Please provide a non-empty data.frame object for x")
})

test_that("train_valid_test_split captures y input data type error", {
  x = data.frame('X1'=c(0,1,2,3,4,5,6,7),
                 'X2'=c(8,9,10,11,12,13,14,15))
  y = 7
  expect_error(train_valid_test_split(x, y) , "Please provide a non-empty data.frame object for y")
})

test_that("train_valid_test_split correctly captures empty x input", {
  x = data.frame()
  y = data.frame('Y'=c(0,1,2,3,4,5,6,7))
  expect_error(train_valid_test_split(x, y), "Your x input is empty")
})

test_that("train_valid_test_split correctly captures empty y input", {
  x = data.frame('X1'=c(0,1,2,3,4,5,6,7),
                 'X2'=c(8,9,10,11,12,13,14,15))
  y = data.frame()
  expect_error(train_valid_test_split(x, y), "Your y input is empty")
})
