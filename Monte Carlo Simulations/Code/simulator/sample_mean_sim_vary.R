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
set.seed(812)

mean_sim_vary <- new_simulation(name="mean_sim_vary",
     label="Sample Mean (varying n)")

mean_sim_vary <- generate_model(mean_sim_vary, make_model=sample_mean_model,
     n=list(50, 500), mu=0, vary_along="n")

mean_sim_vary <- simulate_from_model(mean_sim_vary, nsim=20)

mean_sim_vary <- run_method(mean_sim_vary, methods=list(sample_mean_meth,
     sample_median_meth))

mean_sim_vary <- evaluate(mean_sim_vary, metrics=list(se_metric))

save_simulation(mean_sim_vary)

plot1 <- plot_eval(subset_simulation(mean_sim_vary, n == 50),
     metric_name="se_metric") + scale_y_log10()

print(plot1)

plot2 <- plot_eval(mean_sim_vary, metric_name="se_metric") + scale_y_log10()

print(plot2)

plot3 <- plot_eval_by(mean_sim_vary, metric_name="se_metric", varying="n") +
     scale_y_log10()

print(plot3)

# Create a table
tabulate_eval(mean_sim_vary, metric_name="se_metric")

# Create a dataframe of metrics for further processing (calculating mean and
# standard deviation, statistical inference, etc.)
results_df <- as.data.frame(evals(mean_sim_vary))







