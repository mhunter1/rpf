% Generated by roxygen2 (4.0.2): do not edit by hand
\name{ptw2011.gof.test}
\alias{ptw2011.gof.test}
\title{Compute the P value that the observed and expected tables come from the same distribution}
\usage{
ptw2011.gof.test(observed, expected)
}
\arguments{
\item{observed}{observed matrix}

\item{expected}{expected matrix}
}
\value{
The P value indicating whether the two tables come from
the same distribution. For example, a significant result (P <
alpha level) rejects the hypothesis that the two matrices are from
the same distribution.
}
\description{
This test is an alternative to Pearson's X^2
goodness-of-fit test.  In contrast to Pearson's X^2, no ad hoc cell
collapsing is needed to avoid an inflated false positive rate
in situations of sparse cell frequences.
The statistic rapidly converges to the Monte-Carlo estimate
as the number of draws increases.
}
\examples{
draws <- 17
observed <- matrix(c(.294, .176, .118, .411), nrow=2) * draws
expected <- matrix(c(.235, .235, .176, .353), nrow=2) * draws
ptw2011.gof.test(observed, expected)  # not signficiant
}
\references{
Perkins, W., Tygert, M., & Ward, R. (2011). Computing
the confidence levels for a root-mean-square test of
goodness-of-fit. \emph{Applied Mathematics and Computations,
217}(22), 9072-9084.
}

