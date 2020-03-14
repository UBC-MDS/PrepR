
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

### Installation:

You can install the released version of PrepR from
[CRAN](https://CRAN.R-project.org) with:

``` r
#install.packages("PrepR")
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

  - knitr==1.26 \[@knitr\]
  - tidyverse==1.2.1 \[@tidyverse\]

### Usage

`library(PrepR)`

**Identify features of different data types**

`data_type(my_data)['num']`

`data_type(my_data)['cat']`

**One-hot encode features of categorical type**

`one_hot(my_data)`

**Train, validation, and test split**

`train_valid_test_split(X, y, test_size, valid_size, train_size,
stratify, random_state, shuffle)`

**Standard Scaling of categorical features**  
`X_train = scaler(x_train, x_test, colnames)['x_train']`

`X_test = scaler(x_train, x_test, colnames)['x_test']`

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
