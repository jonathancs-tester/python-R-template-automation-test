import pandas as pd
from pyfaas4i.faas import run_models

# ------ Define properties of the series -----------------
project_name = "ML01-Consumo-Energia-Nstep3-Sanity"

df_example1 = pd.read_excel("cypress/fixtures/Dataset/Mensal/consumo_energia_51caracters.xlsx")
    
# ------ Declare the date variable and its format --------

date_variable = 'data_tidy'
date_format = '%Y-%m-%d'

# ------ Dataframes must be passed in a dictionary
# ------ The key must be named after the variable of interest
data_list = {'Consumo_de_Energia_Centro_oeste_Consumo_de_Energia_': df_example1}

# ------ Define FaaS parameters ---------------------------
model_spec = {
        'log': True,
        'seas.d': True,
        'n_steps': 3,
        'n_windows': 12,
        'n_best': 12,
        'accuracy_crit': 'MAPE',
        'info_crit': 'AIC',
        'exclusions': [],
        'golden_variables': [],
        'fill_forecast': False,
        'cv_summary': 'mean',
        'selection_methods': {
            'lasso': True,
            'rf': True,
            'corr': True,
            'apply.collinear': ["corr","rf","lasso","no_reduction"]
        }
}

run_models(data_list, date_variable, date_format, model_spec, project_name, version_check = False)