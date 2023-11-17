#' @title Linear Model Summary Table
#'
#' @description This function mimics the output of summary(lm()) by fitting a
#' linear model. It then returns the basic summary table of the summary()
#' function, including the OLS estimates, standard errors, t statistics, and
#' p-values reported for each beta value in our model
#'
#' @param data The data used to perform regression on
#'
#' @param func The function for linear regression, in the formula y ~ x
#'
#' @return A data frame with basic summary information, mimicking the
#' summary(lm()) function.
#'
#' @examples
#' summary_lm(mtcars, disp ~ wt)
#' summary_lm(mydata, Depression ~ Fatalism + Age + Sex + R_E)
#'
#' @export
#'
#'

summary_lm <- function(data, func) {
  # Create the design matrix of the equation of interest, define the y variable
  # given the data, the number of rows and the number of columns.
  X <- model.matrix(func, data)
  Y <- data[,c(toString(func[2]))]
  n = nrow(X)
  p = ncol(X)

  # Solve for the beta estimates
  estimate = solve(t(X) %*% X) %*% t(X) %*% Y

  # Solve for the variance covariance matrix
  Yhat = X %*% estimate
  epsilonhat = Y - Yhat
  sigma_squared = t(epsilonhat) %*% epsilonhat/(n-p)
  var_betahat <- solve(t(X) %*% X) * c(sigma_squared)

  # Solve for standard error of the estimates, as well as the t-statistics and
  # the p-values
  se <- sqrt(diag(var_betahat))
  t_stat <- estimate / se
  p_val <- 2*pt(abs(t_stat), df = n - 2, lower.tail = F)

  # Return a data frame containing the estimates, standard error, t-statistics,
  # and p-value
  data.frame(estimate, se, t_stat, p_val)
}
