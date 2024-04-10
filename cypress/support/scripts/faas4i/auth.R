myargs = commandArgs(trailingOnly=TRUE)
file.copy(myargs[1], system.file(package='faas4i'), overwrite = TRUE)