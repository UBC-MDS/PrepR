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
#' @export
#'
#' @examples
#' my_data <- data.frame(animals = c('monkey', 'dog', 'cat'))
#' onehot(my_data)
onehot <- function(encodable_df, drop_first = FALSE) {

  # Input type check:
  if (is.data.frame(encodable_df) ==FALSE) {
    stop("Input should be a dataframe!")
  }

  # Test that the dataframe can be reasonable encoded
  if (length(unique(encodable_df[[1]])) > 10) {
  stop("The column should have fewer than 10 unique values")
  }

  # For inputs with multiple columns:
  if (ncol(encodable_df) > 1) {

    # Input type check:
    if (is.data.frame(encodable_df) ==FALSE) {
      stop("Input should be a dataframe!")
    }

    encoded_df <- onehot(encodable_df[1], drop_first = drop_first)

    for (i in 2:length(encodable_df)) {

      oh_column = onehot(encodable_df[i], drop_first = drop_first)
      encoded_df<- cbind(encoded_df, oh_column)

    }

    return(encoded_df)

  }

  # For one column df:
  header <- names(encodable_df)


  # Rename the columns
  columns <- c()
  for (level in levels(encodable_df[[header]])) {
    columns <- c(columns, level)
  }

  # Make a column of zeroes for each column
  columns2 <- c()
  for (column in columns) {
    assign(column, rep(0,nrow(encodable_df)))

    # Bind the columns together
    columns2 <- c(columns2, as.name(column))
  }

  df <- data.frame(eval(columns2[[1]]))

  if (length(columns2) > 1) {

    if (is.list(columns2) == FALSE) {
      stop("There's a problem with your column names.")
      }

    for (i in 2:length(columns2)) {
      df <- cbind(df, eval(columns2[[i]]))
    }

  }

  names(df) <- columns

  # Count number of instances for each value
  for (name in names(df)) {

    #name <- str_split(name, "_")[[1]][2]

    for (i in seq(1,nrow(encodable_df))) {

      if (encodable_df[i,1] == name) {

        temp_name <- {{name}}

        df[i, temp_name] <- 1
      }
    }
  }

  # Rename the columns
  columns <- c()
  for (level in levels(encodable_df[[header]])) {
    level <- paste0(header, "_", level)
    columns <- c(columns, level)
  }

  names(df) <- columns

  if (drop_first==TRUE) {

    if (length(df) > 1) {

        df <- drop(df[-1])
      }
    }

  df

}

