# ' data_type
# ' Identify features of different data types.
# '
# ' @param df data.frame
# ' Original feature dataframe containing one column for each feature.
# '
# ' @return list of data.frame ($num, $cat)
# ' Stores the categorical and numerical columns separately as two dataframes in one list.
# ' The first element in the list will contain categorical dataframe and the second will contain numerical dataframe.
# '
# ' @examples
# ' my_data <- tibble(fruits = c('apple', 'banana', 'pear'), counts = c(1, 2, 3), price = c(0, 1, 2))
# ' data_type(my_data)$num
# ' data_type(my_data)$cat
data_type <- function(df) {
  num_vars <- c()
  cat_vars <- c()

  if (!inherits(df, "data.frame")) {
    stop("Please provide a valid data.frame object")
  }

  if (length(df) == 0) {
    stop("Please provide a non-empty data.frame object")
  }

  for (i in colnames(df)) {
    c <- df %>% pull(i)

    if (typeof(c) == "character" | typeof(c) == "logical") {
      cat_vars <- append(cat_vars, i)
    } else {
      num_vars <- append(num_vars, i)
    }
  }

  return(list("num" = df[num_vars], "cat" = df[cat_vars]))
}
