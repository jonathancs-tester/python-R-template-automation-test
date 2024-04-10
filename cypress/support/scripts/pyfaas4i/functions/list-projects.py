from pyfaas4i import faas
import sys, json

info = sys.argv[1]

print(faas.list_projects(version_check=False)[info])