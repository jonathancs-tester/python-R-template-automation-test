import pandas as pd
from pyfaas4i.faas import run_models

# ------ Define properties of the series -----------------
project_name = "ts294"

df_example1 = pd.read_excel("cypress/fixtures/Dataset/Trimestral/cagedServicos_RJ.xlsx")
    
# ------ Declare the date variable and its format --------

date_variable = 'data_tidy'
date_format = '%Y-%m-%d'

# ------ Dataframes must be passed in a dictionary
# ------ The key must be named after the variable of interest
data_list = {'saldo_cagedservico_RJ': df_example1}

# ------ Define FaaS parameters ---------------------------
model_spec = {
        'log': True,
        'seas.d': True,
        'n_steps': 4,
        'n_windows': 12,
        'n_best': 20,
        'accuracy_crit': 'MAPE',
        'info_crit': 'AIC',
        'exclusions': [['IDV_RJ_servicos_industriais']],
        'golden_variables': [],
        'fill_forecast': True,
        'cv_summary': 'mean',
        'selection_methods': {
            'lasso': True,
            'rf': True,
            'corr': True,
            'apply.collinear': ["corr","rf","lasso","no_reduction"]
        },
        'lags': {"IDV_RJ_servicos_industriais": [1,2,3], 
                 "IDV_RJ_outros_Servicos": [1,2,3],
                 "z_PIB_servicos_RJ": [1,2,3]},
        'allowdrift': True
}

run_models(data_list, date_variable, date_format, model_spec, project_name, version_check = False)