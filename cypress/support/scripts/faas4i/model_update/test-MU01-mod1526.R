library(faas4i)
    dataset_1 <- readxl::read_excel("cypress/fixtures/model_update/new_data_1526.xlsx")

    # 2) Load forecast pack   ===============================================
    forecast_pack_1 <- readRDS("cypress/fixtures/model_update/fp_1526.rds")

    # 3) Organize pack_list   ===============================================
    pack1 <- list(forecast_pack = forecast_pack_1,
                new_data = dataset_1)
    
    date_variable <- "data_tidy"
    date_format <- '%Y-%m-%d' # or'%m/%d/%Y'

    pack_list <- list(pack1
                    )

    model_spec <- list(n_steps = 5,
                        n_windows = 12,
                        cv_summary = "median",
                        fill_forecast = FALSE)

    ### 4) Set Project Name  ========================================================
    project_name <- "mod1526"
        
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
