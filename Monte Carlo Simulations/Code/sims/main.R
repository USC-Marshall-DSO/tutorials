 # This is the main simulator file

# Delete any plots that were previously created
if(!is.null(dev.list())){
     dev.off()
}

# Clear any previously stored variables, functions, etc.
rm(list=ls())

library(simulator) # this file was created under simulator version 0.2.5
library(ggplot2)

source("model_functions.R")
source("method_functions.R")
source("eval_functions.R")

# Set seed for reproducibility
set.seed(236)

## @knitr init

name_of_simulation <- "mean_sim"

## @knitr main

mean_sim <- new_simulation(name="name_of_simulation", label="Sample Mean")

mean_sim <- generate_model(mean_sim, make_model=sample_mean_model, n=50, mu=0)

mean_sim <- simulate_from_model(mean_sim, nsim=20)

mean_sim <- run_method(mean_sim, methods=list(sample_mean_meth))

mean_sim <- evaluate(mean_sim, metrics=list(se_metric))

save_simulation(mean_sim)

## @knitr plots

# The added function "scale_y_log10" makes the plot on a log scale. This is
# optional.
plot <- plot_eval(mean_sim, metric_name="se_metric") + scale_y_log10()

print(plot)

## @knitr tables

# Create a table
tabulate_eval(mean_sim, metric_name="se_metric")

# Create a dataframe of metrics for further processing (calculating mean and
# standard deviation, statistical inference, etc.)
results_df <- as.data.frame(evals(mean_sim))

print("Results data.frame:")
print(results_df)
















