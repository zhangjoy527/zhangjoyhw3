% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary_lm.R
\name{summary_lm}
\alias{summary_lm}
\title{Linear Model Summary Table}
\usage{
summary_lm(data, func)
}
\arguments{
\item{data}{The data used to perform regression on}

\item{func}{The function for linear regression, in the formula y ~ x}
}
\value{
A data frame with basic summary information, mimicking the
summary(lm()) function.
}
\description{
This function mimics the output of summary(lm()) by fitting a
linear model. It then returns the basic summary table of the summary()
function, including the OLS estimates, standard errors, t statistics, and
p-values reported for each beta value in our model
}
\examples{
summary_lm(mtcars, disp ~ wt)
summary_lm(mydata, Depression ~ Fatalism + Age + Sex + R_E)

}
