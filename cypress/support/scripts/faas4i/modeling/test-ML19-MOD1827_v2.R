library(faas4i)
# Mesmo caso do v1, mas com o allowdrift = FALSE
dataset_1 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/carga_energia_ons_dez21-step2.xlsx")
dataset_1 <- dataset_1[,1:2] ## precisamos dele univariado para esse teste

data_list <- list(dataset_1)
names(data_list) <- c(names(dataset_1)[2])

# Also, specify the date variable and its format
date_variable <- "data_tidy"
date_format <- '%Y-%m-%d' # or'%m/%d/%Y'

model_spec <- list(n_steps = 12,
                   n_windows = 3,
                   log = TRUE,
                   seas.d = TRUE,
                   allowdrift = FALSE)

project_name <- "mod1827_v2"

# Chamando modelagem
faas4i::run_models(data_list = data_list, date_variable = date_variable,
                   date_format = date_format, model_spec = model_spec,
                   project_name = project_name, version_check=F)
