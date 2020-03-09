library(testthat)

context('train_valid_test_split')

#' This script will test the output of the train_valid_test_split function
#' which splits arrays or matrices into random train, validation and test subsets
#' 
#' The proportion of the train set relative to the input data will be valid_size * (1 - test_size)
#' 
#' author: George Thio
#' date: Mar 7, 2020
#' 
#' Test output of default values

test_that('Test length of output data sets based on default values', {
        X = data.frame(c(0,1,2,3,4,5,6,7),
                       c(8,9,10,11,12,13,14,15))
        
        y = data.frame(c(0,1,2,3,4,5,6,7))
        
        train_valid_test_split(x,y)
        
        expect_true((length(x_test) == 2) & (length(x_valid) == 2) & (length(x_train) == 4))
})