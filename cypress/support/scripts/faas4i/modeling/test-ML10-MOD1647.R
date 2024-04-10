library(faas4i)

dataset <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dat_1647.xlsx")
 data_list_ex1 <-list(dataset)
 names(data_list_ex1) <- c(names(dataset)[2])

 # Also, specify the date variable and its format
 date_variable <- "data_tidy"
 date_format <- '%Y-%m-%d' # or'%m/%d/%Y'

 # 2) Basic Modeling Setup
 model_spec_ex1 <- list(n_steps = 1,
                        n_windows = 12)
 # 3) Set Project Name
 project_name <- "mod1647"


 # Send request
 faas4i::run_models(data_list = data_list_ex1, date_variable = date_variable,
                    date_format = date_format, model_spec = model_spec_ex1,
                    project_name = project_name, version_check=F, skip_validation = TRUE)
