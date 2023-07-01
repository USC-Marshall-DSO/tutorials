## @knitr methods

sample_mean_calc <- function(model, draw){

  # Calculate the statistic
  Y_bar <- mean(draw$Y)

  return(list(Y=draw$Y, Y_bar=Y_bar))
}

sample_mean_meth <- new_method(name="sample_mean_meth", label="Sample Mean",
  method=sample_mean_calc)


# Median estimator
sample_median_calc <- function(model, draw){

  # Calculate the statistic
  Y_bar <- median(draw$Y)

  return(list(Y=draw$Y, Y_bar=Y_bar))
}

sample_median_meth <- new_method(name="sample_median_meth",
  label="Sample Median", method=sample_median_calc)



gram_matrix <- function(model, draw){

  # Calculate the statistic
  mat <- t(draw$X) %*% draw$X

  return(list(X=draw$X, mat=mat))
}


matrix_meth <- new_method(name="matrix_meth", label="Gram Matrix",
  method=gram_matrix)






