library(faas4i)

myargs = commandArgs(trailingOnly=TRUE)

while(!exists("project_success")){
    projects <- faas4i::list_projects(version_check = F)
    for(i in 1:length(projects)){
        if(projects[[i]][["status"]] == 'success'){
            project_success <-projects[[i]][["id"]]
        }
    }
}

faas4i::download_zip(project_id = project_success[1], path = myargs[1], filename = myargs[2], version_check = F)