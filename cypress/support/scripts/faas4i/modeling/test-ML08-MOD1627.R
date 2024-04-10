library(faas4i)

dataset_1 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset_1627.xlsx")
data_list_ex1 <-list(dataset_1)
names(data_list_ex1) <- c(names(dataset_1)[2])

# Also, specify the date variable and its format
date_variable <- "data_tidy"
date_format <- '%Y-%m-%d' # or'%m/%d/%Y'

# 3) Set Project Name
project_name <- "mod1627"

model_spec_ex4 <- list(n_steps = 12,
                       n_windows = 2,
                       exclusions = list(list("fs_massa_real",
                                              "fs_rend_medio",
                                              c("fs_pop_ea", "fs_pop_des", "fs_pop_ocu")) ),
                       selection_methods = list(apply.collinear = F))


# Send request
faas4i::run_models(data_list = data_list_ex1, date_variable = date_variable,
                   date_format = date_format, model_spec = model_spec_ex4,
                   project_name = project_name, version_check=F)