library(faas4i)

    dataset_1 <- readxl::read_excel("cypress/fixtures/Dataset/Trimestral/dataset_pibd_ibcd.xlsx")
    dataset_2 <- readxl::read_excel("cypress/fixtures/Dataset/Trimestral/cagedServicos_RJ.xlsx")
    dataset_3 <- readxl::read_excel("cypress/fixtures/Dataset/Trimestral/Feature Selection/dataset_pim_all.xlsx")

    data_list <-  list(dataset_1,
                       dataset_2,
                       dataset_3
                    )

    names(data_list) <- c(names(dataset_1)[2],
                            names(dataset_2)[2],
                            names(dataset_3)[2]
                          )

    date_variable <- "data_tidy"
    date_format <- '%Y-%m-%d' # or'%m/%d/%Y' 


     model_spec <- list(log = TRUE,
                   seas.d = TRUE,
                   n_steps = 4,
                   n_windows = 4,
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
    project_name <- "ML27-All-Dataset-Trimestral"

    faas4i::run_models(data_list = data_list, date_variable = date_variable, 
                            date_format = date_format, model_spec = model_spec,
                            project_name = project_name, version_check = F)