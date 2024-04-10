library(faas4i)
    new_data <- readxl::read_excel("cypress/fixtures/model_update/carga_energia_ons_dez21-step2.xlsx")

    # 2) Load forecast pack   ===============================================
    forecast_pack <- readRDS("cypress/fixtures/model_update/fp_rf_only.rds")

    # 3) Organize pack_list   ===============================================
  pack_list <- list(list(forecast_pack = forecast_pack,
                       new_data = new_data))

date_variable <- "data_tidy"
date_format <- '%Y-%m-%d'

model_spec <- list()

project_name <- "mod1623"

# Chamando modelagem
faas4i::run_update(pack_list = pack_list, date_variable = date_variable,
                   date_format = date_format, project_name = project_name,
                   ## Parameters below are options
                   model_spec = model_spec,
                   cv_update = TRUE,
                   outlier_update = TRUE,
                   breakdown = TRUE,
                   base_dates = TRUE,
                   version_check = F)