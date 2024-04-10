library(faas4i)

dataset <- readxl::read_excel("cypress/fixtures/Dataset/Trimestral/cagedServicos_RJ.xlsx")

data_list <- list(dataset)

names(data_list) <- c(names(dataset)[2])

date_variable <- "data_tidy"
date_format <- '%Y-%m-%d'

## Default settings
model_spec <- list(n_steps = 4,
                   n_windows = 12,
                   fill_forecast = TRUE,
                   lags = list("IDV_RJ_servicos_industriais" = c(1,2,3),
                   "IDV_RJ_outros_Servicos" = c(1,2,3),
                   "z_PIB_servicos_RJ" = c(1,2,3)))

project_name <- "mod1896"

# Chamando modelagem
faas4i::run_models(data_list = data_list, date_variable = date_variable,
                   date_format = date_format, model_spec = model_spec,
                   project_name = project_name, version_check=F)