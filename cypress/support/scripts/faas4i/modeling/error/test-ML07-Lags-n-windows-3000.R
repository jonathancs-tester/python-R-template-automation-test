library(faas4i)

    dataset_1 <- readxl::read_excel("cypress/fixtures/Dataset/Anual/Feature_Selection/dataset_anual_fake.xlsx")
    dataset_2 <- readxl::read_excel("cypress/fixtures/Dataset/Bimestral/Feature_Selection/database_all.xlsx")
    dataset_3 <- readxl::read_excel("cypress/fixtures/Dataset/Diario/dataset_paulista_fluxo.xlsx")
    dataset_4 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset_camb_HDV_DLH.xlsx")
    dataset_5 <- readxl::read_excel("cypress/fixtures/Dataset/Semanal/weekly_cooking.xlsx")
    dataset_6 <- readxl::read_excel("cypress/fixtures/Dataset/Semestral/dataset_semestral_fake.xlsx")
    dataset_7 <- readxl::read_excel("cypress/fixtures/Dataset/Trimestral/dataset_pibd_ibcd.xlsx")
    dataset_8 <- readxl::read_excel("cypress/fixtures/Dataset/Quinzenal/dataset_quinzenal_fake_1.xlsx")

    data_list <-  list(dataset_1,
                    dataset_2,
                    dataset_3,
                    dataset_4, 
                    dataset_5, 
                    dataset_6, 
                    dataset_7,
                    dataset_8
                    )

    names(data_list) <- c("pim",
                          "lasanha",
                          "fluxo_dia",
                          "y_HDV_DLH",
                          "brazil_cooking_cooker_4",
                          "br_npim2",
                          "pibd",
                          "demand"
                          )

    date_variable <- "data_tidy"
    date_format <- '%Y-%m-%d' # or'%m/%d/%Y' 


     model_spec <- list(log = TRUE,
                   seas.d = TRUE,
                   n_steps = 7,
                   n_windows = 3000,
                   n_best = 12,
                   accuracy_crit = "MAPE",
                   info_crit = "AIC",
                   exclusions = list(c("l1_cambio_r", "l1_pib_ind"),
                                     c("l2_cambio_r", "l2_pib_ind")),
                   golden_variables = c("l2_pib_tot"),
                   fill_forecast = FALSE,
                   cv_summary = 'median',
                   selection_methods = list(
                     lasso = TRUE,
                     rf = TRUE,
                     corr = TRUE,
                     apply.collinear = c("corr","rf","lasso","no_reduction")),
                   lags = list("all" = c(1,2,3), "pib_ind" = c(1,2)))


### 3) Set Project Name  ==========================================================
    project_name <- "ML07-All-Dataset-Sanity-Lags"

    faas4i::run_models(data_list = data_list, date_variable = date_variable, 
                            date_format = date_format, model_spec = model_spec,
                            project_name = project_name, version_check = F)
