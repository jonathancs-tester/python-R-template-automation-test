from pyfaas4i import faas
import sys, json

path = sys.argv[1]
filename = sys.argv[2]

is_local_var = False

while is_local_var == False:
    projects = faas.list_projects(version_check=False)
    for row in projects.itertuples(index=True, name='Pandas'):
        if(row.status == "success"):
            project_success = row.id
            is_local_var = "project_success" in locals()


print(faas.download_zip(project_success,path,filename, version_check=False))