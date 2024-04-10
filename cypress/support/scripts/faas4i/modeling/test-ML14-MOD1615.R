library(faas4i)

dataset_1 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset_caminhoes.xlsx")
data_list <-list(dataset_1)

y_name <- names(dataset_1)[2]
names(data_list) <- y_name


date_variable <- "data_tidy"
date_format <- '%Y-%m-%d'

 model_spec <- list(log = TRUE,
                    seas.d = TRUE,
                    n_steps = 3,
                    n_windows = 12,
                    n_best = 12,
                    accuracy_crit = "MAPE",
                    info_crit = "AIC",
                    exclusions = list(),
                    golden_variables = c(),
                    fill_forecast = FALSE,
                      cv_summary = 'mean',
                      selection_methods = list(
                        lasso = TRUE,
                        rf = TRUE,
                        corr = TRUE,
                        apply.collinear = c("corr","rf","lasso","no_reduction")))

project_name <- "mod1615"

# Chamando modelagem
faas4i::run_models(data_list = data_list, date_variable = date_variable,
                   date_format = date_format, model_spec = model_spec,
                   project_name = project_name, version_check=F)
