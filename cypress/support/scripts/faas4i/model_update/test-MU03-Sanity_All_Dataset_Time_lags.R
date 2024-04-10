

library(faas4i)

    dataset_1 <- readxl::read_excel("cypress/fixtures/Dataset/Anual/Feature_Selection/dataset_anual_fake.xlsx")
    dataset_2 <- readxl::read_excel("cypress/fixtures/Dataset/Bimestral/Feature_Selection/database_all.xlsx")
    dataset_3 <- readxl::read_excel("cypress/fixtures/Dataset/Diario/dataset_paulista_fluxo.xlsx")
    dataset_4 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset_camb_HDV_DLH.xlsx")
    dataset_5 <- readxl::read_excel("cypress/fixtures/Dataset/Semanal/weekly_cooking.xlsx")
    dataset_6 <- readxl::read_excel("cypress/fixtures/Dataset/Semestral/dataset_semestral_fake.xlsx")
    dataset_7 <- readxl::read_excel("cypress/fixtures/Dataset/Trimestral/dataset_pibd_ibcd.xlsx")
    dataset_8 <- readxl::read_excel("cypress/fixtures/Dataset/Quinzenal/dataset_quinzenal_fake_1.xlsx")

    # 2) Load forecast pack   ===============================================
    forecast_pack_1 <- readRDS("cypress/fixtures/Forecast/lags/pim.rds")
    forecast_pack_2 <- readRDS("cypress/fixtures/Forecast/lags/lasanha.rds")
    forecast_pack_3 <- readRDS("cypress/fixtures/Forecast/lags/fluxo_dia.rds")
    forecast_pack_4 <- readRDS("cypress/fixtures/Forecast/lags/y_hdv_dlh.rds")
    forecast_pack_5 <- readRDS("cypress/fixtures/Forecast/lags/brazil_cooking_cooker.rds")
    forecast_pack_6 <- readRDS("cypress/fixtures/Forecast/lags/br_npim2.rds")
    forecast_pack_7 <- readRDS("cypress/fixtures/Forecast/lags/pibd.rds")
    forecast_pack_8 <- readRDS("cypress/fixtures/Forecast/lags/demand.rds")

    # 3) Organize pack_list   ===============================================
    pack1 <- list(forecast_pack = forecast_pack_1,
                new_data = dataset_1)
    pack2 <- list(forecast_pack = forecast_pack_2,
                new_data = dataset_2)
    pack3 <- list(forecast_pack = forecast_pack_3,
                new_data = dataset_3)
    pack4 <- list(forecast_pack = forecast_pack_4,
                new_data = dataset_4)
    pack5 <- list(forecast_pack = forecast_pack_5,
                new_data = dataset_5)
    pack6 <- list(forecast_pack = forecast_pack_6,
                new_data = dataset_6)
    pack7 <- list(forecast_pack = forecast_pack_7,
                new_data = dataset_7)
    pack8 <- list(forecast_pack = forecast_pack_8,
                new_data = dataset_8)

    pack_list <- list(
                    pack1,
                    pack2,
                    pack3,
                    pack4,
                    pack5,
                    pack6,
                    pack7,
                    pack8)

    date_variable <- "data_tidy"
    date_format <- '%Y-%m-%d' # or'%m/%d/%Y'


    model_spec <- list(log = FALSE,
                      seas.d = TRUE,
                      n_steps = 12,
                      n_windows = 3,
                      n_best = 12,
                      accuracy_crit = "MAPE",
                      info_crit = "AIC",
                      exclusions = list(c("l1_cambio_r", "l1_pib_ind"),
                                     c("l2_cambio_r", "l2_pib_ind"),
                                     c("l3_cambio_r", "l3_pib_ind")),
                      golden_variables = c("l2_pib_tot"),
                      selection_methods = list(
                        lasso = TRUE,
                         rf = TRUE,
                        corr = TRUE,
                        apply.collinear = c("corr","rf","lasso","no_reduction")),
                      lags = list("all" = c(1), "pib_ind" = c(1)))


    ### 4) Set Project Name  ========================================================
    project_name <- "MU03-SANITY_ALL_DATASET_TYPES-LAGS"


 faas4i::run_update(pack_list = pack_list, date_variable = date_variable,
                   date_format = date_format, project_name = project_name,
                   ## Parameters below are options
                   model_spec = model_spec,
                   cv_update = TRUE,
                   outlier_update = TRUE,
                   breakdown = TRUE,
                   base_dates = TRUE, 
                   version_check = F
                   #save_local="/home/jonathan/Downloads"
                   )
