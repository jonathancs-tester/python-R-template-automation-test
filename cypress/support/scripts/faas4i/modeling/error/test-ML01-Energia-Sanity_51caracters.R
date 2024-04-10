library(faas4i)
    dataset_1 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/consumo_energia_51caracters.xlsx")

    data_list <-  list(dataset_1)
    names(data_list) <- c("Consumo_de_Energia_Centro_oeste_Consumo_de_Energia_")
    date_variable <- "data_tidy"
    date_format <- '%Y-%m-%d' # or'%m/%d/%Y' 


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


    project_name <- "ML01-Consumo-Energia-Nstep3-Sanity"

    faas4i::run_models(data_list = data_list, date_variable = date_variable, 
                            date_format = date_format, model_spec = model_spec,
                            project_name = project_name, version_check = F)

    model_spec <- list(log = TRUE,
                    seas.d = TRUE,
                    n_steps = 12,
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


    project_name <- "ML01-Consumo-Energia-Nstep12-Sanity"

    faas4i::run_models(data_list = data_list, date_variable = date_variable, 
                            date_format = date_format, model_spec = model_spec,
                            project_name = project_name, version_check = F)
