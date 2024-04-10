library(faas4i)

dataset_1 <- readxl::read_excel("cypress/fixtures/Dataset/Diario/dat_1648.xlsx")
data_list <-list(dataset_1)

y_name <- names(dataset_1)[2]
names(data_list) <- y_name


date_variable <- "data_tidy"
date_format <- '%Y-%m-%d'

## Default settings
model_spec <- list(n_steps = 7,
                   n_windows = 2)

project_name <- "mod1648"

# Chamando modelagem
faas4i::run_models(data_list = data_list, date_variable = date_variable,
                   date_format = date_format, model_spec = model_spec,
                   project_name = project_name, version_check=F)
