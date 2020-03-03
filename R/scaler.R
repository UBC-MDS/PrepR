#' data_type
#' Identify features of different data types.
#'
#' @param df data.frame
#' Original feature dataframe containing one column for each feature.
#'
#' @return list of data.frame
#' Stores the categorical and numerical columns separately as two dataframes in one list.
#' The first element in the list will contain categorical dataframe and the second will contain numerical dataframe.
#'
#' @examples
#' my_data <- tibble(fruits = c('apple', 'banana', 'pear'), counts = c(1, 2, 3), price = c(0, 1, 2))
#' data_type(my_data)
data_type <- function(df) {
}

#' One-Hot encode a dataframe
#' 
#' One-hot encodes a dataframe whose features are all categorical
#'
#' @param encodable_df data.frame
#' A dataframe of categorical features.
#'
#' @return data.frame
#' Returns the same dataframe with useful column names and one-hot encoded features
#'
#' @examples
#' my_data <- tibble(animals = c('monkey', 'dog', 'cat'))
#' onehot(my_data)
data_type <- function(encodable_df) {
}

#' scaler
#' Perform standard scaler on numerical features.
#'
#' @param x_train data.frame
#' Dataframe of train set containing columns to be scaled.
#' 
#' @param x_valid data.frame
#' Dataframe of validation set containing columns to be scaled.
#' 
#' @param x_test data.frame
#' Dataframe of test set containing columns to be scaled.
#' 
#' @param colnames vector
#' Vector of column names for numeric features
#' 
#' @return list of data.frame
#' Stores the x_train, x_valid and x_test separately as three dataframes in one list.
#' The first element in the list will contain x_train, second will be x_valid and the third will contain x_test.
#'
#' @examples
#' x_train <- tibble(colors = c('Blue', 'Red', 'Green'), counts = c(34, 35, 56), usage = c(4, 6, 9))
#' 
#' x_valid <- tibble(colors = c('Blue', 'Red', 'Green'), counts = c(29, 65, 13), usage = c(5, 27, 10))
#' 
#' x_test <- tibble(colors = c('Blue', 'Red', 'Green'), counts = c(20, 35, 18), usage = c(9, 6, 0))
#' 
#' colnames <- c('counts', 'usage')
#' 
#' scaler(x_train, x_test, colnames)
scaler <- function(X_train, X_validation, X_test, colnames) {
  library(tidyverse)
  library(testthat)
  
  X_train_scaled <- data.frame(X_train)
  X_train_scaled[colnames] <- scale(X_train[colnames])
  
  X_validation_scaled <- data.frame(X_validation)
  X_validation_scaled[colnames] <- scale(X_validation[colnames])
  
  X_test_scaled <- data.frame(X_test)
  X_test_scaled[colnames] <- scale(X_test[colnames])
 
  
  scaled_data <- list(X_train_scaled, X_validation_scaled, X_test_scaled)
  names(scaled_data) <- c('X_train', 'X_validation', 'X_test')
  
  return(scaled_data)
}
