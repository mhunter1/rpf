% Generated by roxygen2 (4.0.2): do not edit by hand
\name{orderCompletely}
\alias{orderCompletely}
\title{Order a data.frame by missingness and all columns}
\usage{
orderCompletely(observed)
}
\arguments{
\item{observed}{a data.frame holding ordered factors in every column}
}
\value{
the sorted order of the rows
}
\description{
Completely order all rows in a data.frame.
}
\examples{
df <- as.data.frame(matrix(c(sample.int(2, 30, replace=TRUE)), 10, 3))
mask <- matrix(c(sample.int(3, 30, replace=TRUE)), 10, 3) == 1
df[mask] <- NA
df[orderCompletely(df),]
}

