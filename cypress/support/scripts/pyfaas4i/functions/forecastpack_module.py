from pyfaas4i.forecastpack import forecast
from pyfaas4i.forecastpack import install_R_packages
import sys, json

path = sys.argv[1]
# installing necessary R packages
# install_R_packages()

example_rds = forecast()

example_rds.from_rds('cypress/fixtures/Forecast/Mensal/forecast_1_y_test.rds')
## If you are using Windows, you might have to user '\\' instead of '/'

# Listing all the models
print(example_rds.model_list())
