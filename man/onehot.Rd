% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/onehot.R
\name{onehot}
\alias{onehot}
\title{One-Hot encode a dataframe}
\usage{
onehot(encodable_df)
}
\arguments{
\item{encodable_df}{data.frame
A dataframe of categorical features.}
}
\value{
data.frame
Returns the same dataframe with useful column names and one-hot encoded features
}
\description{
One-hot encodes a dataframe whose features are all categorical
}
\examples{
my_data <- data.frame(animals = c('monkey', 'dog', 'cat'))
onehot(my_data)
}
