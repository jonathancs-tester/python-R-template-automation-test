library(faas4i)

    dataset_1 <- readxl::read_excel("cypress/fixtures/Dataset/Quinzenal/dataset_quinzenal_fake_1.xlsx")

    data_list <-  list(dataset_1
                    )

    names(data_list) <- c(names(dataset_1)[2]
                          )

    date_variable <- "data_tidy"
    date_format <- '%Y-%m-%d' # or'%m/%d/%Y' 


     model_spec <- list(log = TRUE,
                   seas.d = TRUE,
                   n_steps = 26,
                   n_windows = 14,
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


### 3) Set Project Name  ==========================================================
    project_name <- "ML28-All-Dataset-Quinzenal"

    faas4i::run_models(data_list = data_list, date_variable = date_variable, 
                            date_format = date_format, model_spec = model_spec,
                            project_name = project_name, version_check = F)