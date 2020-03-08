#' train_valid_test_split
#' Splits arrays or matrices into random train, validation and test subsets
#' The proprotion of the train set relative to the input data will be valid_size * (1 - test_size)
#'
#' @param
#' X, y arrays
#' @param X (data frame)
#' Original features from data set
#' @param y (data frame)
#' Original labels from data set
#' @param test_size (double, default = NULL)
#' Value between 0.0 and 1.0 to represent the proportion of the dataset to comprise the size of the test subset
#' @param valid_size float or None (default = 0.25)
#' Value between 0.0 and 1.0 to represent the proportion of the dataset to comprise the size of the test subset
#' @param random_state (int, default = NULL)
#' Seed for the random number generator
#' @shuffle (default = TRUE)
#' Shuffle the rows or not
#'
#' @import gensvm
#'
#' @return
#' @export
#'
#' @examples
#' x <- iris[, -5]
#' y <- iris[, 5]
#'
#' Use default values
#' split <- gensvm.train.test.split(x, y)

train_valid_test_split <- function(X,
                                   y = NULL,
                                   test_size = 0.25,
                                   valid_size = 0.25,
                                   shuffle = TRUE,
                                   random_state = NULL) {

  #' Check data input types
  if (class(x) != 'data.frame') stop('You have not inputted an acceptable data type for x')
  if (class(y) != 'data.frame') stop('You have not inputted an acceptable data type for y')

  #' Check y input dimension
  if (ncol(y) != 1) stop('Your y input is of the wrong dimension')

  #' Check for empty data input
  if (dim(x)[1] == 0) stop ('Your x input is empty')
  if (dim(y)[1] == 0) stop('Your y input is empty')

  # Split into `test` set and `resplit` set to be resplit into `train` and `valid` sets
  splits_1 <- gensvm::gensvm.train.test.split(x,
                                              y[,1],
                                              test.size=test_size,
                                              random.state=random_state,
                                              shuffle=shuffle)
  x_test <- splits_1[2]
  y_test <- splits_1[4]

  x_resplit <- data.frame(splits_1[1])
  y_resplit <- data.frame(splits_1[3])

  splits_2 <- gensvm::gensvm.train.test.split(x_resplit,
                                              y_resplit[,1],
                                              test.size=valid_size,
                                              random.state=random_state,
                                              shuffle=shuffle)

  x_train <- splits_2[1]
  x_valid <- splits_2[2]

  y_train <- splits_2[3]
  y_valid <- splits_2[4]


  return(c(x_train, x_valid, x_test, y_train, y_valid, y_test))
}

