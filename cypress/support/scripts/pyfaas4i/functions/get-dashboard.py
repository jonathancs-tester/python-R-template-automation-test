from pyfaas4i import faas
from pyfaas.explore import compare_packs, get_dashboard

folder where forecastpack files are
base_path = '../inputs/Forecast/Anual/' 
desired path and name of the HTML file
target_path = './example_dashboard.html'

get_dashboard(base_path, target_path, metric='MAPE')
