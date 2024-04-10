library(faas4i)

    dataset_1 <- readxl::read_excel("cypress/fixtures/Dataset/Diario/dataset_diario_fake_5.xlsx")
    dataset_2 <- readxl::read_excel("cypress/fixtures/Dataset/Diario/base_diario_atvos_TIDY.xlsx")
    dataset_3 <- readxl::read_excel("cypress/fixtures/Dataset/Diario/dataset_paulista_fluxo.xlsx")
    dataset_4 <- readRDS("cypress/fixtures/Dataset/Diario/dat_1610.rds")
    dataset_5 <- readxl::read_excel("cypress/fixtures/Dataset/Diario/dat_1648.xlsx")
    dataset_6 <- readRDS("cypress/fixtures/Dataset/Diario/dataset_diario_discreto_longo.rds")
    dataset_7 <- read.csv("cypress/fixtures/Dataset/Diario/dataset_diario_fake_6.csv")
    dataset_8 <- read.csv("cypress/fixtures/Dataset/Diario/Ibov_diario.csv")
    dataset_9 <- readxl::read_excel("cypress/fixtures/Dataset/Diario/vendas_cambio_input.xlsx")

    data_list <-  list(dataset_1,
                    dataset_2,
                    dataset_3,
                    dataset_4, 
                    dataset_5, 
                    dataset_6,
                    dataset_7,
                    dataset_8,
                    dataset_9
                    )

    names(data_list) <- c(names(dataset_1)[2],
                          names(dataset_2)[2],
                          names(dataset_3)[2],
                          names(dataset_4)[2],
                          names(dataset_5)[2],
                          names(dataset_6)[2],
                          names(dataset_7)[2],
                          names(dataset_8)[2],
                          names(dataset_9)[2]
                          )

    date_variable <- "data_tidy"
    date_format <- '%Y-%m-%d' # or'%m/%d/%Y' 


     model_spec <- list(log = TRUE,
                   seas.d = TRUE,
                   n_steps = 7,
                   n_windows = 3,
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
    project_name <- "ML16-All-Dataset-Diario"

    faas4i::run_models(data_list = data_list, date_variable = date_variable, 
                            date_format = date_format, model_spec = model_spec,
                            project_name = project_name, version_check = F)