# Delete any plots that were previously created
if(!is.null(dev.list())){
     dev.off()
}

# Clear any previously stored variables, functions, etc.
rm(list=ls())

# Load packages
library(simulator)
library(ggplot2)

# Load functions we wrote
source("model_functions.R")
source("method_functions.R")
source("eval_functions.R")

# Set seed for reproducibility
set.seed(236)

mean_sim <- new_simulation(name="mean_sim", label="Sample Mean")

mean_sim <- generate_model(mean_sim, make_model=sample_mean_model, n=50, mu=0)

mean_sim <- simulate_from_model(mean_sim, nsim=20)

mean_sim <- run_method(mean_sim, methods=list(sample_mean_meth))

mean_sim <- evaluate(mean_sim, metrics=list(se_metric))

save_simulation(mean_sim)

plot <- plot_eval(mean_sim, metric_name="se_metric") + scale_y_log10()

print(plot)

# Create a table
tabulate_eval(mean_sim, metric_name="se_metric")

# Create a dataframe of metrics for further processing (calculating mean and
# standard deviation, statistical inference, etc.)
results_df <- as.data.frame(evals(mean_sim))

print("Results data.frame:")
print(results_df)
