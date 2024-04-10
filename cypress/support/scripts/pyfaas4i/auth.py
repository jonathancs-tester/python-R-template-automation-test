import shutil
import sys
import pyfaas4i
 
myargs = sys.argv[1]
dest_file = pyfaas4i.__path__[0]+'/config.json'

# Copy file example.txt into a new file called example_copy.txt
shutil.copyfile(myargs, dest_file)