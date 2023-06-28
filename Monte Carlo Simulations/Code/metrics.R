# Example 1

# Parameters
n <- 50
mu <- 0

# Generate vector of data
X <- rnorm(n, mean=mu)

# Calculate the statistic
X_bar <- mean(X)

# Calculate the metric
sq_err <- (X_bar - mu)^2



# Example 2

# Parameters
n <- 20
p <- 5

# Generate data
data <- rnorm(n*p)

# Put it in a matrix
X <- matrix(data, nrow=n, ncol=p)

# Calculate the statistic
mat <- t(X) %*% X

# Calculate the metrics

# Symmetry
is_symmetric <- as.integer(identical(t(mat), mat))

# (Consider adding a little bit of tolerance for numerical error)
is_symmetric_2_bool <- max(abs(t(mat) - mat)) < 10^(-9)

is_symmetric_2 <- as.integer(is_symmetric_2_bool)

# Mininum eigenvalue
min_eigen <- min(eigen(mat)$values)



