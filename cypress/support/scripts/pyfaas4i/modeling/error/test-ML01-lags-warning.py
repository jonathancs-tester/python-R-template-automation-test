import pandas as pd
from pyfaas4i.faas import run_models

# ------ Define properties of the series -----------------
project_name = "ML01-Multiple-Y-Python"

df_example1 = pd.read_excel("cypress/fixtures/Dataset/Anual/Feature_Selection/dataset_anual_fake.xlsx")
df_example2 = pd.read_excel("cypress/fixtures/Dataset/Bimestral/Feature_Selection/database_all.xlsx")
df_example3 = pd.read_excel("cypress/fixtures/Dataset/Diario/dataset_paulista_fluxo.xlsx")
df_example4 = pd.read_excel("cypress/fixtures/Dataset/Mensal/dataset_camb_HDV_DLH.xlsx")
df_example5 = pd.read_excel("cypress/fixtures/Dataset/Semanal/weekly_cooking.xlsx")
df_example6 = pd.read_excel("cypress/fixtures/Dataset/Semestral/dataset_semestral_fake.xlsx")
df_example7 = pd.read_excel("cypress/fixtures/Dataset/Trimestral/dataset_pibd_ibcd.xlsx")
    
# ------ Declare the date variable and its format --------

date_variable = 'data_tidy'
date_format = '%Y-%m-%d'

# ------ Dataframes must be passed in a dictionary
# ------ The key must be named after the variable of interest
data_list = {'pim': df_example1,
             'lasanha': df_example2,
             'fluxo_dia': df_example3,
             'y_HDV_DLH': df_example4,
             'brazil_cooking_cooker_4': df_example5,
             'br_npim2': df_example6,
             'pibd': df_example7
            }

# ------ Define FaaS parameters ---------------------------
model_spec = {
        'log': True,
        'seas.d': True,
        'n_steps': 7,
        'n_windows': 2,
        'n_best': 12,
        'accuracy_crit': 'MAPE',
        'info_crit': 'AIC',
        'exclusions': [
                ["l1_cambio_r", "l1_pib_ind"],
                ["l2_cambio_r", "l2_pib_ind"]
                ],
        'golden_variables': ["l2_pib_tot"],
        'fill_forecast': False,
        'cv_summary': 'mean',
        'selection_methods': {
            'lasso': True,
            'rf': True,
            'corr': True,
            'apply.collinear': ["corr","rf","lasso","no_reduction"]
        },
        'lags': {"all": [1,2,3], "pib_ind": [1,2]},
        'allowdrift': False
}

run_models(data_list, date_variable, date_format, model_spec, project_name, version_check = False)
