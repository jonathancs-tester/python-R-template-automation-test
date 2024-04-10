library(faas4i)

dataset_1 <- readxl::read_excel("cypress/fixtures/Dataset/Bimestral/Feature_Selection/database_all.xlsx")
data_list <-list(dataset_1)
names(data_list) <- c(names(dataset_1)[2])


date_variable <- "data_tidy"
date_format <- '%Y-%m-%d'

## Default settings
model_spec <- list(n_steps = 2,
                   n_windows = 2,
                   exclusions = list(c("d_b1_ex", "p_carnes", "d_b3_ex"),
                                     c("z_g1", "z_g2")),
                   golden_variables = c("z_g1", "p_carnes"),
                   lags = list("p_carnes" = 1:3,
                                "z_g1" = 1:3,
                                "d_b1_ex" = 1:3))
project_name <- "ts1036"

faas4i::validate_models(data_list = data_list, date_variable = date_variable,
                        date_format = date_format, model_spec = model_spec,
                        project_name = project_name, version_check=F)