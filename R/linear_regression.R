linear_regression <- function(X,
                              Y,
                              intercept = T) {
  ## Build matrixes
  Y <- as.matrix(Y)
  X <- as.matrix(X)
  ## Dimensions of X
  n <- nrow(X)
  p <- ncol(X)
  ## If there is an intercept (default)
  ## X need to cbind with a vector of ones
  if (intercept) {
    X <- cbind(rep(1,n), X)
    p <- p+1
  }
  ## Estimation of beta
  beta_hat <- solve(t(X)%*%X)%*%t(X)%*%Y
  ## Fitted value
  Y_hat <- X%*%beta_hat
  ## Residuals and mean standard error
  residual <- Y-Y_hat
  MSE <- t(residual)%*%residual/(n-p)
  ## Varaince and standard error of estimated coefficients
  var_beta_hat <- diag(solve(t(X)%*%X))*c(MSE)
  se_beta_hat <- sqrt(var_beta_hat)
  ## T stats
  t_statistics <- c(beta_hat/se_beta_hat)
  p_value <- c(2*(1-stats::pt(q=abs(t_statistics), df = n-p)))
  ## Output
  print(noquote("Regression coefficients: "))
  output <- cbind(Estimation = c(beta_hat),
                  Standard_error = se_beta_hat,
                  t_statistics = t_statistics,
                  p_value = p_value)
  if(intercept) {
    if(length(colnames(X))==0){
      rownames(output) <- c("(Intercept)",paste0("var_",1:(p-1)))
    }
    else{
      rownames(output) <- c("(Intercept)",colnames(X)[-1])
    }
  }
  else {
    if(length(colnames(X))==0){
      rownames(output) <- c(paste0("var_",1:(p)))
    }
    else{
      rownames(output) <- colnames(X)
    }
  }
  print(output)
  cat("\n")
  ## R squared value
  print(noquote("R squared: "))
  print(R_squared <- 1-sum(residual^2)/sum((Y-mean(Y))^2))
  ## It is a list of 6 components. These elements are included:
  ## 1. beta_hat; 2. R_squared value; 3. predictor: X;
  ## 4. Estimation of Y; 5. Residuals; 6. whether have intercept
  return(list(output, R_squared, X, Y_hat, residual, intercept))
}

