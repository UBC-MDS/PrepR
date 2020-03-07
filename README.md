
<!-- README.md is generated from README.Rmd. Please edit that file -->

## PrepR

<!-- badges: start -->

![](https://github.com/UBC-MDS/PrepR/workflows/build/badge.svg)
[![codecov](https://codecov.io/gh/UBC-MDS/PrepR/branch/master/graph/badge.svg)](https://codecov.io/gh/UBC-MDS/PrepR)
![Release](https://github.com/UBC-MDS/PrepR/workflows/Release/badge.svg)

[![Documentation
Status](https://readthedocs.org/projects/PrepR/badge/?version=latest)](https://PrepR.readthedocs.io/en/latest/?badge=latest)
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
    categorical features and returns a dataframe for the train, test,
    validation sets with sensible column names.

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

We were unable to find any packages that do everything that ours does,
but there are packages for machine learning in R that we will make use
of. The `caret` package in R does some of these preprocessing steps,
such as train/test split. However, it does not seem that there is an
option for having a validation set in `caret`. The `caret` package also
does one-hot encoding with the function `dummyVars`, though we aim to
have a function that’s more intuitive. Overall, we feel this package
will fit in well with the R ecosystem and help make machine learning a
little easier.

### Documentation

The official documentation is hosted on Read the Docs:
<https://PrepR.readthedocs.io/en/latest/>

### Credits

This package was created using the the [Whole Game
Chapter](https://r-pkgs.org/whole-game.html) from the [R
Packages](https://r-pkgs.org/) handbook by Hadley Wickham
