#' train_valid_test_split
#' Splits feature and target data frames into random train, validation and test subsets
#' The proportion of the train set relative to the input data will be valid_size * (1 - test_size)
#'
#' @param
#' x, y arrays
#' @param x (data frame)
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
#' x = data.frame('X1'=c(0,1,2,3,4,5,6,7),
#'                'X2'=c(8,9,10,11,12,13,14,15))
#'
#' y = data.frame('Y'=c(0,1,2,3,4,5,6,7))
#'
#'
#' train_valid_test_split(x,y)$x_train
#' train_valid_test_split(x,y)$x_valid
#' train_valid_test_split(x,y)$x_test
#' train_valid_test_split(x,y)$y_train
#' train_valid_test_split(x,y)$y_valid
#' train_valid_test_split(x,y)$y_test

train_valid_test_split <- function(x,
                                   y,
                                   test_size = 0.25,
                                   valid_size = 0.25,
                                   shuffle = TRUE,
                                   random_state = NULL
                                   ) {


  # Check data input types
  if (class(x) != 'data.frame') stop('Please provide a non-empty data.frame object for x')
  if (class(y) != 'data.frame') stop('Please provide a non-empty data.frame object for y')

  # Check for empty data input
  if (dim(x)[1] == 0) stop('Your x input is empty')
  if (dim(y)[1] == 0) stop('Your y input is empty')

  # Split into `test` set and `resplit` set to be resplit into `train` and `valid` sets
  splits_1 <- gensvm::gensvm.train.test.split(x,
                                              y[,1],
                                              test.size=test_size,
                                              random.state=random_state,
                                              shuffle=shuffle)

  x_test <- splits_1$x.test
  y_test <- splits_1$y.test

  x_resplit <- splits_1$x.train
  y_resplit <- splits_1$y.train

  splits_2 <- gensvm::gensvm.train.test.split(x_resplit,
                                              y_resplit,
                                              test.size=valid_size,
                                              random.state=random_state,
                                              shuffle=shuffle
                                              )

  x_valid <- splits_2$x.test
  y_valid <- splits_2$y.test

  x_train <- splits_2$x.train
  y_train <- splits_2$y.train

  return(list('x_train' = data.frame(x_train),
              'x_valid' = data.frame(x_valid),
              'x_test' = data.frame(x_test),
              'y_train' = data.frame(y_train),
              'y_valid' = data.frame(y_valid),
              'y_test' = data.frame(y_test)
              )
         )
}

