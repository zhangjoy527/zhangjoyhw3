# Linear Model Summary Table package for BIOSTAT 625

## Overview
This github repository is a package with a single function, <code>summary_lm()</code>. This function mimics using the <code>summary()</code> function on an <code>lm()</code> linear model, where the linear model is fit by the OLS method. 

## Installation
<code> #Install and load devtools
install.packages("devtools")
library(devtools)
</code>
<code>
#Use devtools to download the package from github, and load package
devtools::install_github("zhangjoy527/zhangjoyhw3")
library(zhangjoyhw3)

## Usage
To use <code>summary_lm()</code>, provide a data set and a model formula in the form <code>y ~ x</code>, where y is your outcome variable and x is any predictors of interest. 

## Example
<code>dummary_lm(data = mtcars, formula = disp ~ wt)</code>
