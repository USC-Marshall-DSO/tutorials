# Example 1

# Parameters
n <- 50
mu <- 0

# Generate vector of data
X <- rnorm(n, mean=mu)



# Example 2

# Parameters
n <- 20
p <- 5

# Generate data
data <- rnorm(n*p)

# Put it in a matrix
X <- matrix(data, nrow=n, ncol=p)