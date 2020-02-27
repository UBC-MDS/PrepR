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
