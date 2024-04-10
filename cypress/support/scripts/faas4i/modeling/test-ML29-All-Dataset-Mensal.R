library(faas4i)

    dataset_1 <- readxl::read_excel("cypress/fixtures/model_update/new_data_1526.xlsx")
    dataset_2 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset_all_ecolatina.xlsx")
    dataset_3 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset_camb_HDV_DLH.xlsx")
    # dataset_4 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/carga_energia_ons_dez21-step2.xlsx") -> Removido por Y duplicado (TS-802)
    dataset_5 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/consumo_energia_co.xlsx")
    # dataset_6 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dat_1584_1.xlsx") -> Removido por Y duplicado (TS-802)
    dataset_7 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dat_1584_2.xlsx")
    dataset_8 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset_pmc_r_all.xlsx")
    dataset_9 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset_date_dummy_value.xlsx")
    dataset_10 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset_1627.xlsx")
    dataset_11 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dat_1683.xlsx")
    dataset_12 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset_1645.xlsx")
    dataset_13 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset_caminhoes.xlsx")
    dataset_14 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/no_explanatory_variables.xlsx")
    dataset_15 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/carga_energia_ons_dez21-step2.xlsx")
    dataset_15 <- dataset_15[,1:2] ## precisamos dele univariado para esse teste
    dataset_16 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset_si_e1_stills_all.xlsx")
    dataset_17 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset1486.xlsx")
    dataset_18 <- read.csv("cypress/fixtures/Dataset/Mensal/agg_mundial.csv")
    dataset_19 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dat_exp_mt.xlsx")
    dataset_20 <- read.csv("cypress/fixtures/Dataset/Mensal/data_genoa_PIM.csv")
    dataset_21 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset_1466.xlsx")
    dataset_22 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset_all_ind_n.xlsx")
    dataset_23 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset_caged_all.xlsx")
    dataset_24 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset_fatura_ipca.xlsx")
    dataset_25 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset_mod1465.xlsx")
    dataset_26 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset1550.xlsx")
    dataset_27 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/debug_test_mensal_fake_3.xlsx")
    dataset_28 <- read.csv("cypress/fixtures/Dataset/Mensal/df_warning_MOD1554.csv")
    dataset_29 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/fs_pim_1583.xlsx")
    dataset_30 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/fs_pim_1584_1.xlsx")
    dataset_31 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/fs_pim_1584_2.xlsx")
    dataset_32 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/Inputs_CCR_rodoanelP.xlsx")
    dataset_33 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/Feature_Selection/ds_1_4_all.xlsx")
    dataset_34 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/Feature_Selection/fogoes_atlas_8_var_Y.xlsx")
    dataset_35 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/Feature_Selection/p1_d12_3_bain_original.xlsx")
    dataset_36 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/Feature_Selection/resumo_PIM_Bradesco.xlsx")
    dataset_37 <- readxl::read_excel("cypress/fixtures/Dataset/Mensal/dataset_RJ_2_pib_rj.xlsx")

    data_list <- list(
                        dataset_1, 
                        dataset_2,
                        dataset_3,
                        # dataset_4, 
                        dataset_5,
                        # dataset_6, 
                        dataset_7,
                        dataset_8, 
                        dataset_9,
                        dataset_10,
                        dataset_11,
                        dataset_12,
                        dataset_13,
                        dataset_14,
                        dataset_15,
                        dataset_16,
                        dataset_17,
                        dataset_18,
                        dataset_19,
                        dataset_20,
                        dataset_21,
                        dataset_22,
                        dataset_23,
                        dataset_24,
                        dataset_25,
                        dataset_26,
                        dataset_27,
                        dataset_28,
                        dataset_29,
                        dataset_30,
                        dataset_31,
                        dataset_32,
                        dataset_33,
                        dataset_34,
                        dataset_35,
                        dataset_36,
                        dataset_37
                        )


    date_variable <- "data_tidy"
    date_format <- '%Y-%m-%d' # or'%m/%d/%Y'
    names(data_list) <- c(
                            names(dataset_1)[2],
                            names(dataset_2)[2],
                            names(dataset_3)[2],
                            # names(dataset_4)[2],
                            names(dataset_5)[2],
                            # names(dataset_6)[2],
                            names(dataset_7)[2],
                            names(dataset_8)[2],
                            names(dataset_9)[2],
                            names(dataset_10)[2],
                            names(dataset_11)[2],
                            names(dataset_12)[2],
                            names(dataset_13)[2],
                            names(dataset_14)[2],
                            names(dataset_15)[2],
                            names(dataset_16)[2],
                            names(dataset_17)[2],
                            names(dataset_18)[2],
                            names(dataset_19)[2],
                            names(dataset_20)[2],
                            names(dataset_21)[2],
                            names(dataset_22)[2],
                            names(dataset_23)[2],
                            names(dataset_24)[2],
                            names(dataset_25)[2],
                            names(dataset_26)[2],
                            names(dataset_27)[2],
                            names(dataset_28)[2],
                            names(dataset_29)[2],
                            names(dataset_30)[2],
                            names(dataset_31)[2],
                            names(dataset_32)[2],
                            names(dataset_33)[2],
                            names(dataset_34)[2],
                            names(dataset_35)[2],
                            names(dataset_36)[2],
                            names(dataset_37)[2]
                        )

     model_spec <- list(log = TRUE,
                   seas.d = TRUE,
                   n_steps = 12,
                   n_windows = 2,
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

    ### 4) Set Project Name  ========================================================
    project_name <- "ML29-All-Dataset-Mensal"
        
    faas4i::run_models(data_list = data_list, date_variable = date_variable, 
                            date_format = date_format, model_spec = model_spec,
                            project_name = project_name, version_check = F,
                            # save_local = "/home/alisson/projetos/modelagem/mod-automation-test/cypress/fixtures"
                        )