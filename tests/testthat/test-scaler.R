#' Test function for PrepR::scaler() function
test_scaler <- function() {
#Helper data
X_train <- tibble(colors = c('Blue', 'Red', 'Green'), counts = c(34, 35, 56), usage = c(4, 6, 9))
X_validation <- tibble(colors = c('Blue', 'Red', 'Green'), counts = c(29, 65, 13), usage = c(5, 27, 10))
X_test <- tibble(colors = c('Blue', 'Red', 'Green'), counts = c(20, 35, 18), usage = c(9, 6, 0))
colnames <- c('counts', 'usage')

#Bad inputs 
empty_df <- tibble() #empty
bad_input <- "For test" #wrong type

output_set <- scaler(X_train, X_validation, X_test, colnames)

test_that("function output should have 3 outputs", {
  expect_equal(length(output_set), 3)
})

#Check input and output dimensions are equal
test_that("The dimensions of each function output should be equal to each input", {
  expect_equal(dim(X_train), dim(output_set$X_train))
  expect_equal(dim(X_test), dim(output_set$X_test))
  expect_equal(dim(X_validation), dim(output_set$X_validation))
  })

#Ensure only dataframe objects are accepted
test_that("Only data.frame objects are accepted", {
  expect_true((is.data.frame(X_train) & is.data.frame(X_test) & is.data.frame(X_validation)))
  expect_true(is.data.frame(output_set$X_train) & is.data.frame(output_set$X_test) & is.data.frame(output_set$X_validation))
})

#Ensure input data is transformed
test_that("Input data should not be equal to output data", {
  expect_false(isTRUE(all.equal(X_train, output_set$X_train)))
  expect_false(isTRUE(all.equal(X_validation, output_set$X_validation)))
  expect_false(isTRUE(all.equal(X_test, output_set$X_test)))
})

#Test exceptions in data input
test_that("scaler correctly captures input error",{
  expect_error(scaler(bad_input, X_validation, X_test, colnames), "Input data must be data.frame object")
  expect_error(scaler(empty_df, X_validation, X_test, colnames), "Input data cannot be empty")
})

#Test a value from output
test_that("scaler correctly captures input error",{
  expect_equal(output_set$X_train[2,2], -0.5366348, tolerance = .002)
  expect_equal(output_set$X_test[3,2], -0.6816212, tolerance = .002)
})
}
test_scaler()