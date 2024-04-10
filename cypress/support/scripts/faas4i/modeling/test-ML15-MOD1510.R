library(faas4i)

dataset_1 <- readRDS("cypress/fixtures/Dataset/Diario/dat_1610.rds")
# dataset_1 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/no_explanatory_variables.xlsx")

data_list <-list(dataset_1)

y_name_1 <- names(dataset_1)[2]
# y_name_2 <- names(dataset_2)[2]
names(data_list) <- c(y_name_1)


date_variable <- "data_tidy"
date_format <- '%Y-%m-%d'

model_spec <- list(log = TRUE,
            seas.d = TRUE,
            n_steps = 30,
            n_windows = 60,
            n_best = 20,
            accuracy_crit = "MAPE",
            info_crit = "AIC",
            fill_forecast = TRUE,
            cv_summary = "mean",
            exclusions = list(),
            golden_variables = c("preco_aju"),
            selection_methods = list(
            lasso = TRUE,
            rf = TRUE,
            corr = TRUE,
            apply.collinear = c("corr","rf","lasso","no_reduction"))
)

project_name <- "mod1510"

# Chamando modelagem
faas4i::run_models(data_list = data_list, date_variable = date_variable,
                   date_format = date_format, model_spec = model_spec,
                   project_name = project_name, version_check=F)