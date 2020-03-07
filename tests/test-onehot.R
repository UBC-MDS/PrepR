library(testthat)
library(PrepR)

# Helper data
fruits <- data.frame(species = c("apple", "grape", "pear"))
fruits$species <- as.factor(fruits$species)

output = onehot(fruits)

test_that("Length of input and output should be equal", {
  expect_equal(length(fruits[[1]]), length(output[[1]]))
})

levels(test[[names(test)]])
test_that("There should not be more than 10 unique values", {
  expect_error(onehot(mtcars$mpg))
})




onehot(test)


test[5,1] ==8
