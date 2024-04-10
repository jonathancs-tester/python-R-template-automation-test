import glob
from pyfaas4i.forecastpack import forecast
from pyfaas4i.explore import compare_packs
from pyfaas4i.explore import model_accuracy
# Reading from rds files
rds_list = glob.glob('cypress/fixtures/inputs/Forecast/Anual/*.rds')
forecast_list = [forecast.readRDS(x) for x in rds_list]
comparison = compare_packs(forecast_list)
comparison1 = model_accuracy(packs=forecast_list, n_steps=5, cv_summary='mean', metric='MAPE')
print(comparison)
print(comparison1)