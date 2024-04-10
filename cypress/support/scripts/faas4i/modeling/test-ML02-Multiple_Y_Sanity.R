library(faas4i)

    dataset_1 <- readRDS("cypress/fixtures/Dataset/sanity/dataset_all_com_co")
    dataset_2 <- readRDS("cypress/fixtures/Dataset/sanity/dataset_all_com_n")
    dataset_3 <- readRDS("cypress/fixtures/Dataset/sanity/dataset_all_com_ne")
    dataset_4 <- readRDS("cypress/fixtures/Dataset/sanity/dataset_all_com_s")
    dataset_5 <- readRDS("cypress/fixtures/Dataset/sanity/dataset_all_com_se")
    dataset_6 <- readRDS("cypress/fixtures/Dataset/sanity/dataset_all_ind_co")
    dataset_7 <- readRDS("cypress/fixtures/Dataset/sanity/dataset_all_ind_n")
    dataset_8 <- readRDS("cypress/fixtures/Dataset/sanity/dataset_all_ind_ne")
    dataset_9 <- readRDS("cypress/fixtures/Dataset/sanity/dataset_all_ind_s")
    dataset_10 <- readRDS("cypress/fixtures/Dataset/sanity/dataset_all_ind_se")
    dataset_11 <- readRDS("cypress/fixtures/Dataset/sanity/dataset_all_res_co")
    dataset_12 <- readRDS("cypress/fixtures/Dataset/sanity/dataset_all_res_n")
    dataset_13 <- readRDS("cypress/fixtures/Dataset/sanity/dataset_all_res_ne")
    dataset_14 <- readRDS("cypress/fixtures/Dataset/sanity/dataset_all_res_s")
    dataset_15 <- readRDS("cypress/fixtures/Dataset/sanity/dataset_all_res_se")
    
    data_list <- list(dataset_1, dataset_2, dataset_3, dataset_4, dataset_5,
                      dataset_6, dataset_7, dataset_8, dataset_9, dataset_10,
                      dataset_11, dataset_12, dataset_13, dataset_14, dataset_15)

    names(data_list) <- c("com_mw", "com_n", "com_ne", "com_s", "com_se",
                          "ind_mw", "ind_n", "ind_ne", "ind_s", "ind_se",
                          "res_mw", "res_n", "res_ne", "res_s", "res_se")

    date_variable <- "data_tidy"
    date_format <- '%Y-%m-%d'


    model_spec <- list(log = TRUE,
                    seas.d = TRUE,
                    n_steps = 12,
                    n_windows = 24,
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


    project_name <- "ML02-15Y-Dataset-All-Sanity"

    faas4i::run_models(data_list = data_list, date_variable = date_variable, 
                            date_format = date_format, model_spec = model_spec,
                            project_name = project_name, version_check = F)

