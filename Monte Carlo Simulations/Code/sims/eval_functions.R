## @knitr metrics

se_metric_func <- function(model, out) {
     # Calculate the metric
     sq_err <- (out$Y_bar - model$mu)^2

     return(sq_err)
}

se_metric <- new_metric("se_metric", "Squared Error", metric=se_metric_func)


symmetry_metric <- new_metric("symmetry_metric", "Is Symmetric", metric =
     function(model, out) {

          # Calculate the metric
          # (Consider adding a little bit of tolerance for numerical error)
          is_symmetric_2_bool <- max(abs(t(out$mat) - out$mat)) < 10^(-9)

          is_symmetric_2 <- as.integer(is_symmetric_2_bool)

          return(is_symmetric_2)
     }
)

min_eigen_metric <- new_metric("min_eigen_metric", "Minimum Eigenvalue",
     metric = function(model, out) {

          # Calculate the metric
          min_eigen <- min(eigen(out$mat)$values)

          return(min_eigen)
     }
)








