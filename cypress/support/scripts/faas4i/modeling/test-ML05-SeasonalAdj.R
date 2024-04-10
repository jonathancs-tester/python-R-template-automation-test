library(faas4i)

    dataset_1 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dat_1581.xlsx")

    data_list <-  list(dataset_1)
    names(data_list) <- c(names(dataset_1)[2])
    date_variable <- "data_tidy"
    date_format <- '%Y-%m-%d' # or'%m/%d/%Y' 


    model_spec <- list(log = TRUE,
                   seas.d = TRUE,
                   n_steps = 6,
                   n_windows = 6,
                   n_best = 20,
                   accuracy_crit = "MAPE",
                   info_crit = "AIC",
                   exclusions = list(c('pib_br','pmca_br','pmc_br','pib_rj','pmca_rj','pmc_rj','pib_se','pmca_se','pmc_se')),
                   golden_variables = c(),
                   fill_forecast = FALSE,
                   cv_summary = "mean",
                   selection_methods = list(
                     lasso = TRUE,
                     rf = TRUE,
                     corr = TRUE,
                     apply.collinear = c("corr","rf","lasso","no_reduction")))


    project_name <- "ML04-Seasonal Adjus Broken 24 hrs"

    faas4i::run_models(data_list = data_list, date_variable = date_variable, 
                            date_format = date_format, model_spec = model_spec,
                            project_name = project_name, version_check = F)
