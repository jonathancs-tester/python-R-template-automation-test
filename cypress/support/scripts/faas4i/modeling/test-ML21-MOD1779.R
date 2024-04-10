library(faas4i)

dataset <- readxl::read_excel("cypress/fixtures/Dataset/Diario/vendas_cambio_input.xlsx")

data_list <- list(dataset)

names(data_list) <- c(names(dataset)[2])

date_variable <- "data_tidy"
date_format <- '%Y-%m-%d'

## Default settings
model_spec <- list(n_steps = 7,
                   n_windows = 103)

project_name <- "mod1779"

# Chamando modelagem
faas4i::run_models(data_list = data_list, date_variable = date_variable,
                   date_format = date_format, model_spec = model_spec,
                   project_name = project_name, version_check=F)