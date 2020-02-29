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
#' @param x_test data.frame
#' Dataframe of test set containing columns to be scaled.
#' 
#' @param colnames vector
#' Vector of column names for numeric features
#' 
#' @return list of data.frame
#' Stores the x_train and x_test separately as two dataframes in one list.
#' The first element in the list will contain x_train and the second will contain x_test.
#'
#' @examples
#' x_train <- tibble(colors = c('Blue', 'Red', 'Green'), counts = c(34, 35, 56), usage = c(4, 6, 9))
#' x_test <- tibble(colors = c('Blue', 'Red', 'Green'), counts = c(20, 35, 18), usage = c(9, 6, 0))
#' colnames <- c('counts', 'usage')
#' 
#' scaler(x_train, x_test, colnames)
scaler <- function(x_train, x_test, colnames) {
}