#' scaler
#' Perform standard scaler on numerical features.
#'
#' @param x_train data.frame
#' Dataframe of train set containing columns to be scaled.
#'
#' @param x_valid data.frame
#'
#' Dataframe of validation set containing columns to be scaled.
#'
#' @param x_test data.frame
#' Dataframe of test set containing columns to be scaled.
#'
#' @param colnames vector
#' Vector of column names for numeric features
#'
#' @export
#' 
#' @return list of data.frame
#' Stores the x_train, x_valid
#' and x_test separately as three dataframes in one list.
#' The first element in the list will contain x_train, second will be x_valid
#' and the third will contain x_test.
#'
#' @examples
#' x_train <- data.frame(colors = c('Blue', 'Red', 'Green'), counts = c(34, 35, 56), usage = c(4, 6, 9))
#'
#' x_valid <- data.frame(colors = c('Blue', 'Red', 'Green'), counts = c(29, 65, 13), usage = c(5, 27, 10))
#'
#' x_test <- data.frame(colors = c('Blue', 'Red', 'Green'), counts = c(20, 35, 18), usage = c(9, 6, 0))
#'
#' colnames <- c('counts', 'usage')
#'
#' X_train = scaler(x_train, x_valid, x_test, colnames)$X_train
#' X_test = scaler(x_train, x_valid, x_test, colnames)$X_test
#' x_valid = scaler(x_train, x_valid, x_test, colnames)$x_valid
ation


scaler <- function(X_train, x_valid, X_test, colnames) {
  library(testthat)

  if (!inherits(X_train, "data.frame") | !inherits(X_test, "data.frame") | !inherits(x_valid, "data.frame")) {
    stop("Input data must be data.frame object")
  }
  
  if (length(X_train) == 0 | length(X_test) == 0 | length(x_valid) == 0 | length(colnames) == 0) {
    stop("Input data cannot be empty")
    }

  X_train_scaled <- data.frame(X_train)
  X_train_scaled[colnames] <- scale(X_train[colnames])

  x_valid_scaled <- data.frame(x_valid)
  x_valid_scaled[colnames] <- scale(x_valid[colnames])

  X_test_scaled <- data.frame(X_test)
  X_test_scaled[colnames] <- scale(X_test[colnames])


  scaled_data <- list(X_train_scaled, x_valid_scaled, X_test_scaled)
  names(scaled_data) <- c('X_train', 'x_valid', 'X_test')

  return(scaled_data)
}
