library(faas4i)

dataset_1 <- readxl::read_excel("cypress/fixtures/Dataset/Diario/dat_mult_seas_1621.xlsx")
data_list <-list(dataset_1)
names(data_list) <- c(names(dataset_1)[2])

date_variable <- "data_tidy"
date_format <- '%Y-%m-%d'

## Default settings
model_spec <- list(n_steps = 28,
                   n_windows = 1)

project_name <- "mod1621"

# Chamando modelagem
faas4i::run_models(data_list = data_list, date_variable = date_variable,
                   date_format = date_format, model_spec = model_spec,
                   project_name = project_name, version_check=F)
