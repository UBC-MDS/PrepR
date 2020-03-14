#' Test function for PrepR::scaler() function
test_scaler <- function() {
#Helper data
x_train <- tibble(colors = c('Blue', 'Red', 'Green'), counts = c(34, 35, 56), usage = c(4, 6, 9))
x_valid <- tibble(colors = c('Blue', 'Red', 'Green'), counts = c(29, 65, 13), usage = c(5, 27, 10))
x_test <- tibble(colors = c('Blue', 'Red', 'Green'), counts = c(20, 35, 18), usage = c(9, 6, 0))
colnames <- c('counts', 'usage')

#Bad inputs
empty_df <- tibble() #empty
bad_input <- "For test" #wrong type

output_set <- scaler(x_train, x_valid, x_test, colnames)

test_that("function output should have 3 outputs", {
  expect_equal(length(output_set), 3)
})

#Check input and output dimensions are equal
test_that("The dimensions of each function output should be equal to each input", {
  expect_equal(dim(x_train), dim(output_set$x_train))
  expect_equal(dim(x_test), dim(output_set$x_test))
  expect_equal(dim(x_valid), dim(output_set$x_valid))
  })

#Ensure only dataframe objects are accepted
test_that("Only data.frame objects are accepted", {
  expect_true((is.data.frame(x_train) & is.data.frame(x_test) & is.data.frame(x_valid)))
  expect_true(is.data.frame(output_set$x_train) & is.data.frame(output_set$x_test) & is.data.frame(output_set$x_valid))
})

#Ensure input data is transformed
test_that("Input data should not be equal to output data", {
  expect_false(isTRUE(all.equal(x_train, output_set$x_train)))
  expect_false(isTRUE(all.equal(x_valid, output_set$x_valid)))
  expect_false(isTRUE(all.equal(x_test, output_set$x_test)))
})

#Test exceptions in data input
test_that("scaler correctly captures input error",{
  expect_error(scaler(bad_input, x_valid, x_test, colnames), "Input data must be data.frame object")
  expect_error(scaler(empty_df, x_valid, x_test, colnames), "Input data cannot be empty")
})

#Test a value from output
test_that("scaler correctly captures input error",{
  expect_equal(output_set$x_train[2,2], -0.5366348, tolerance = .002)
  expect_equal(output_set$x_test[3,2], -0.6816212, tolerance = .002)
})
}
test_scaler()
