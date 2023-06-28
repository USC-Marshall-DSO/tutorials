sample_mean_model <- function(n, mu){
    
    samp_mean_mod <- new_model(name = "samp_mean_mod", 
        label = sprintf("Sample mean model (n = %s, mu = %s)", n, mu),
        params = list(n=n, mu=mu), simulate = sample_mean_simulate)

    return(samp_mean_mod)
}

sample_mean_simulate <- function(n, mu, nsim){

    # List we'll return: will be length nsim, and every element will be a
    # named list with element X.
    ret_list <- list()

    for(i in 1:nsim){
        # Generate vector of data
        Y <- rnorm(n, mean=mu)

        ret_list[[i]] <- list(Y=Y)
    }
    
    return(ret_list)
}












matrix_model <- function(n, p){
    
    mat_mod <- new_model(name = "mat_mod", 
        label = sprintf("Matrix model (n = %s, p = %s)", n, p),
        params = list(n=n, p=p), simulate = matrix_simulate)

    return(mat_mod)
}

matrix_simulate <- function(n, p, nsim){

    # List we'll return: will be length nsim, and every element will be a
    # named list with element X.
    ret_list <- list()

    for(i in 1:nsim){
        # Generate data
        data <- rnorm(n*p)

        # Put it in a matrix
        X <- matrix(data, nrow=n, ncol=p)

        ret_list[[i]] <- list(X=X)
    }
    
    return(ret_list)
}
