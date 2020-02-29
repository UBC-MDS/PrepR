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

#' train_valid_test
#' Split arrays or matrices into random train, validation and test subsets
#'
#' @param X data.frame
#' Sequence of indexable of same length as y
#' Contains the original features from the data set
#'
#' @param y data.frame
#' Sequence of indexable of same length as X
#' Contains the original features from the data set
#'
#' @param test_size numeric, integer or None, optional (default=None).
#' If numeric, a value between 0.0 and 1.0 to represent the proportion of the dataset to comprise the size of the test subset
#' If integer, a value for the absolute number of test samples
#' If None, the value is set to the complement of the sum of the train_size and test_size
#' If train_size and test_size are also None, the value is set to 0.25
#'
#' @param valid_size numeric, integer or None, (default=None)
#' If numeric, a value between 0.0 and 1.0 to represent the proportion of the dataset to comprise the size of the test subset
#' If integer, a value for the absolute number of validation samples
#' If None, the value will be set to 0.0
#'
#' @param train_size numeric, integer or None, (default=None)
#' If numeric, a value between 0.0 and 1.0 to represent the proportion of the dataset to comprise the size of the test subset
#' If integer, a value for the absolute number of train samples
#' If None, the value will be set to 0.0
#'
#' @param stratify data.frame or None (default=None)
#' If not None, splits categorical data in a stratified fashion preserving the same proportion of classes in the train, valid and test sets, using this input as the class labels
#'
#' @param random_state integer, optional (default=None)
#' A value for the seed to be used by the random number generator
#' If None, the value will be set to 1
#'
#' @param shuffle: boolean, optional (default=TRUE)
#' Indicate whether data is to be shuffled prior to splitting
#'
#' @return list, length=(3 * length(X))
#' Containis train, validation and test splits of the input data
#'
#' @examples
#' X <- tibble(c(0, 10), c(2, 3), c(4, 5), c(6, 7),
#'             c(8,9), c(10, 11), c(12, 13), c(14, 15)),
#' Y <- tibble(0, 1, 2, 3, 4, 5, 6, 7)
train_valid_test <- function(X, y, test_size, valid_size, train_size,
                             stratify, random_state, shuffle) {
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
