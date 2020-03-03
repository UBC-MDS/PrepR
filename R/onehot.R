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


  # Helper data
  fruits <- data.frame(species = c("apple", "grape", "pear"))
  fruits$species <- as.factor(fruits$species)


  columns <- c()
  for (level in levels(fruits$species)) {
    columns <- c(columns, level)
  }

  columns2 <- c()

  for (column in columns) {
    assign(column, rep(0,3))
    columns2 <- c(columns2, as.name(column))
  }

  df <- data.frame(eval(columns2[[1]]))

  for (i in seq(2, length(columns2))) {
    df <- cbind(df, eval(columns2[[i]]))
  }

  names(df) <- columns

  for (name in names(df)) {
    for (i in seq(1,length(fruits$species))) {

      if (fruits$species[i] == name) {

        temp_name <- {{name}}

        df[i, temp_name] <- 1
      }
    }
  }
