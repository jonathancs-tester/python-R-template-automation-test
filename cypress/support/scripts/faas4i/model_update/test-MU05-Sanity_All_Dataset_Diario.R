

library(faas4i)

    dataset_1 <- readxl::read_excel("cypress/fixtures/Dataset/Diario/base_diario_atvos_TIDY.xlsx")
    dataset_1_1 <- readxl::read_excel("cypress/fixtures/Dataset/Diario/base_diario_atvos_TIDY.xlsx")
    dataset_2 <- readxl::read_excel("cypress/fixtures/Dataset/Diario/dataset_paulista_fluxo.xlsx")
    dataset_3 <- readxl::read_excel("cypress/fixtures/Dataset/Diario/dataset_paulista_fluxo.xlsx")
    dataset_4 <- readxl::read_excel("cypress/fixtures/Dataset/Diario/dataset_diario_fake_1.xlsx")
    dataset_5 <- readxl::read_excel("cypress/fixtures/Dataset/Diario/dataset_diario_fake_5.xlsx")
    dataset_6 <- read.csv("cypress/fixtures/Dataset/Diario/dataset_diario_fake_6.csv")

    # 2) Load forecast pack   ===============================================
    forecast_pack_1 <- readRDS("cypress/fixtures/Forecast/Diario/forecast_1_media_7d_hidratado_comb.rds")
    forecast_pack_1_1 <- readRDS("cypress/fixtures/Forecast/Diario/forecast_1_media_7d_hidratado_comb_novo.rds")
    forecast_pack_2 <- readRDS("cypress/fixtures/Forecast/Diario/fp_150.rds")
    forecast_pack_3 <- readRDS("cypress/fixtures/Forecast/Diario/fp_140.rds")
    forecast_pack_4 <- readRDS("cypress/fixtures/Forecast/Diario/forecast_1_mov_por_dia.rds")
    forecast_pack_5 <- readRDS("cypress/fixtures/Forecast/Diario/forecast_1_z_valortotalitem.rds")
    forecast_pack_6 <- readRDS("cypress/fixtures/Forecast/Diario/forecast_1_demand.rds")

    # 3) Organize pack_list   ===============================================
    pack1 <- list(forecast_pack = forecast_pack_1,
                new_data = dataset_1)
    pack1_1 <- list(forecast_pack = forecast_pack_1_1,
                new_data = dataset_1_1)
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

    pack_list <- list(pack1,
                    pack1_1,
                    pack2,
                    pack3,
                    pack4,
                    pack5,
                    pack6)

    date_variable <- "data_tidy"
    date_format <- '%Y-%m-%d' # or'%m/%d/%Y'


    model_spec <- list(n_steps = 7,
                        n_windows = 3,
                        cv_summary = "median",
                        fill_forecast = FALSE)


    ### 4) Set Project Name  ========================================================
    project_name <- "MU05-ALL_DATASET_DIARIOS"


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
