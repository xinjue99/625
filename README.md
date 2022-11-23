
<!-- README.md is generated from README.Rmd. Please edit that file -->

# linreg

<!-- badges: start -->

[![R-CMD-check](https://github.com/xinjue99/Linear-regression/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/xinjue99/Linear-regression/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/xinjue99/Linear-regression/branch/master/graph/badge.svg)](https://app.codecov.io/gh/xinjue99/Linear-regression?branch=master)
<!-- badges: end -->

The goal of linreg is to analyze the model of linear regression. Linear
regression is a significant analyzing model in our daily lives. The
model has the predictors x, responses y and many relationships among
them. My package linreg consists of some useful methods in linear
regression to get significant statistics. There is a funcation called
linear_regression to generate linear models. It mainly includes these
statistics for people to analyze a model: 1. Standard error; 2.
R_squared value; 3. t-statistics; 4. p-value; 5. Estimation of
coefficients

## Installation

You can install the development version of linreg from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("xinjue99/Linear-regression")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
#Import the package from the library
library(linreg)
#Import the example data set
dt <- mtcars
model_car <- linear_regression(X = dt[,c(2,3)],
                              Y = dt$mpg
                              )
#> [1] Regression coefficients: 
#>              Estimation Standard_error t_statistics      p_value
#> (Intercept) 34.66099474     2.54700388    13.608536 4.019007e-14
#> cyl         -1.58727681     0.71184427    -2.229809 3.366495e-02
#> disp        -0.02058363     0.01025748    -2.006696 5.418572e-02
#> 
#> [1] R squared: 
#> [1] 0.7595658

##Then some regression coefficients could be demonstrated.
## basic example code
```
