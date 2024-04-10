library(faas4i)

dataset <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset_fatura_ipca.xlsx")

data_list <- list(dataset)
names(data_list) <- c("fatura_ipca")

date_variable <- "data_tidy"
date_format <- '%Y-%m-%d'

model_spec <- list(log = FALSE,
                   seas.d = TRUE,
                   n_steps = 3,
                   n_windows = 10,
                   n_best = 20,
                   accuracy_crit = "MAPE",
                   info_crit = "AIC",
                   exclusions = list(c("conc_cred","ici")),
                   golden_variables = list(),
                   fill_forecast = TRUE,
                   cv_summary = 'mean',
                   selection_methods = list(
                     lasso = TRUE,
                     rf = TRUE,
                     corr = TRUE,
                     apply.collinear = c("corr","rf","lasso","no_reduction"))
                )


### 3) Set Project Name  ==========================================================
project_name <- "TS1075_notwarnings"

faas4i::run_models(data_list = data_list, date_variable = date_variable, 
                   date_format = date_format, model_spec = model_spec,
                   project_name = project_name, version_check = F)
