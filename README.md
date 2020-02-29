
<!-- README.md is generated from README.Rmd. Please edit that file -->

## PrepR

<!-- badges: start -->

![](https://github.com/UBC-MDS/PrepR/workflows/build/badge.svg)
[![codecov](https://codecov.io/gh/UBC-MDS/PrepR/branch/master/graph/badge.svg)](https://codecov.io/gh/UBC-MDS/PrepR)
![Release](https://github.com/UBC-MDS/PrepR/workflows/Release/badge.svg)

[![Documentation
Status](https://readthedocs.org/projects/PrepR/badge/?version=latest)](https://PrepR.readthedocs.io/en/latest/?badge=latest)
<!-- badges: end -->

This is an R package that preprocesses data as follows:

  - Identifies features of different data types in a dataframe

  - Splits data into train, validation, and test sets

  - One-hot encodes features of categorical type

  - Performs standard scaling of categorical features

  - The package returns preprocessed and split train, validation, and
    test data sets ready for analysis/modelling

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

  - split data set into train, validation, and test sets

  - identify data types for each column/feature

  - perform one-hot encoding on the categorical features

  - perform standardcscaling on the numerical features

  - concat the generated columns to original dataframe

  - rename columns

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

### Documentation

The official documentation is hosted on Read the Docs:
<https://PrepR.readthedocs.io/en/latest/>

### Credits

This package was created using the the [Whole Game
Chapter](https://r-pkgs.org/whole-game.html) from the [R
Packages](https://r-pkgs.org/) handbook by Hadley Wickham
