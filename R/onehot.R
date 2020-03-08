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
onehot <- function(encodable_df) {

  # Input type check:
  if (is.data.frame(encodable_df) ==FALSE) {
    stop("Input should be a dataframe!")
  }

  # Test that the dataframe can be reasonable encoded
  if (length(unique(encodable_df[[1]])) > 10) {
  stop("The column should have fewer than 10 unique values")
  }

  # For one column df:
  header <- names(encodable_df)

  columns <- c()
  for (level in levels(encodable_df[[header]])) {
    columns <- c(columns, level)
  }

  columns2 <- c()

  for (column in columns) {
    assign(column, rep(0,nrow(encodable_df)))
    columns2 <- c(columns2, as.name(column))
  }

  df <- data.frame(eval(columns2[[1]]))

  for (i in seq(2, length(columns2))) {
    df <- cbind(df, eval(columns2[[i]]))
  }

  names(df) <- columns

  for (name in names(df)) {
    for (i in seq(1,nrow(encodable_df))) {

      if (encodable_df[i,1] == name) {

        temp_name <- {{name}}

        df[i, temp_name] <- 1
      }
    }
  }

  df
}
