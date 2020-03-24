
<!-- README.md is generated from README.Rmd. Please edit that file -->

## PrepR

<!-- badges: start -->

[![R build
status](https://github.com/UBC-MDS/PrepR/workflows/R-CMD-check/badge.svg)](https://github.com/UBC-MDS/PrepR/actions)
[![codecov](https://codecov.io/gh/UBC-MDS/PrepR/branch/master/graph/badge.svg)](https://codecov.io/gh/UBC-MDS/PrepR)
<!-- badges: end -->

### Package Summary

`PrepR` is a package for R to help preprocessing in machine learning
tasks. There are certain repetitive tasks that come up often when doing
a machine learning project and this package aims to alleviate those
chores. Some of the issues that come up regularly are: finding the types
of each column in a dataframe, splitting the data (whether into
train/test sets or train/test/validation sets, one-hot encoding, and
scaling features. This package will help with all of those tasks.

Please find detailed descriptions of the functions in this
[vignette](https://ubc-mds.github.io/PrepR/articles/my-vignette.html).

### Installation:

You can install the released version of PrepR from
[CRAN](https://CRAN.R-project.org) with:

``` r
# install.packages("PrepR")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/PrepR")
```

### Features

This package has the following features:

  - `train_valid_test_split`: This function splits the data set into
    train, validation, and test sets.

  - `data_type`: This function identifies data types for each
    column/feature. It returns one dataframe for each type of data.

  - `one-hot`: This function performs one-hot encoding on the
    categorical features and returns a dataframe with sensible column
    names.

  - `scaler`: This function performs standard scaling on the numerical
    features.

### Dependencies

R version 3.6.1 and R packages:

  - dplyr
  - gensvm
  - tibble
  - nlme
  - magrittr

### Usage

`library(PrepR)`

**Identify features of different data types**

`data_type(my_data)$num`

`data_type(my_data)$cat`

Examples:

``` r
fruits_df <- data.frame(fruits = c("apple", "pear", "apple", "banana", "orange"), count = c(1L, 2L, 3L, 4L, 5L), price = c(2, 3.4, 0.5, 7, 8))
fruits_y <- data.frame(target = c(1, 2, 3, 4, 5))

fruits_df
#>   fruits count price
#> 1  apple     1   2.0
#> 2   pear     2   3.4
#> 3  apple     3   0.5
#> 4 banana     4   7.0
#> 5 orange     5   8.0
```

``` r
data_type(fruits_df)$num
#>   count price
#> 1     1   2.0
#> 2     2   3.4
#> 3     3   0.5
#> 4     4   7.0
#> 5     5   8.0
```

**Train, validation, and test split**

`train_valid_test_split(X, y, test_size, valid_size, train_size,
stratify, random_state, shuffle)`

Examples:

``` r
train_valid_test_split(fruits_df, fruits_y)$x_train
#>   fruits count price
#> 4 banana     4   7.0
#> 3  apple     3   0.5
#> 1  apple     1   2.0
```

**One-hot encode features of categorical type**

`onehot(my_data)`

Examples:

``` r
onehot(data_type(fruits_df)$cat)
#>   apple banana orange pear
#> 1     1      0      0    0
#> 2     0      0      0    1
#> 3     1      0      0    0
#> 4     0      1      0    0
#> 5     0      0      1    0
```

**Standard Scaling of categorical features**

`scaler(x_train, x_test, colnames)$x_train`

`scaler(x_train, x_test, colnames)$x_test`

Examples:

``` r
num_var <- data_type(fruits_df)$num

scaler(num_var, num_var, num_var, c("count", "price"))$x_train
#>        count      price
#> 1 -1.2649111 -0.6772277
#> 2 -0.6324555 -0.2423108
#> 3  0.0000000 -1.1432100
#> 4  0.6324555  0.8760468
#> 5  1.2649111  1.1867017
```

### Our package in the R ecosystem

There are no packages that do everything that this one does, but there
are packages for machine learning in R that this package will make use
of. The `caret` package in R does some of these preprocessing steps,
such as train/test split. It does not, however, have a function that
takes a dataframe and returns multiple dataframes based on their column
type; this is the issue that this package’s `data_type` function seeks
to solve. However, it does not seem that there is an option for having a
validation set in `caret`’s version of train/test split. This is an
option that would be useful to anyone doing machine learning. The
`caret` package also does one-hot encoding with the function
`dummyVars`, though `onehot()` in the PrepR package is more intuitive:
its function does not return meaningful, human-readable column names. It
also removes one column by default, which is better for fast
computation, but worse for human-readability.

Overall, this package fits in well with the R ecosystem and helps make
machine learning a little easier.

### Documentation

The official documentation is hosted on Read the Docs:
<https://PrepR.readthedocs.io/en/latest/>

### Credits

This package was created using the [Whole Game
Chapter](https://r-pkgs.org/whole-game.html) from the [R
Packages](https://r-pkgs.org/) handbook by Hadley Wickham
