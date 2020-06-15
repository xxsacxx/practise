import my_module as mm
import os 
import sys
import diff_directory_one_level.test_module


## when running from root dir everything works if we give module location from 
## current working directory 

cwd = os.getcwd()
importing_dir = str(cwd)+ "/diff_directory_two_level"
sys.path.append(importing_dir)
print(sys.path)
import level2.test_module
# sys.path.remove('/Users/onion8/Desktop/practise/python/rel_imports')
# sys.path.remove('/Users/onion8/Desktop/practise/python/rel_imports/src')
# print(sys.path)




courses = ['History', 'Math', 'Physics', 'CompSci']
idx = mm.find_index(courses,'Math')
print("index is {0}".format(idx))


## explanation from doc : https://docs.python.org/3/library/sys.html?highlight=sys#module-sys

# A list of strings that specifies the search path for modules. Initialized from the 
# environment variable PYTHONPATH, plus an installation-dependent default.

# As initialized upon program startup, the first item of this list, path[0], 
# is the directory containing the script that was used to invoke the Python interpreter. 
# If the script directory is not available (e.g. if the interpreter is invoked 
# interactively or if the script is read from standard input), path[0] is the empty 
# string, which directs Python to search modules in the current directory first. 
# Notice that the script directory is inserted before the entries inserted as a result 
# of PYTHONPATH.


#Observations :
# 1-  It adds both cwd i.e rel_imports and rel_imports/src when running from 
# rel_imports as python src/intro.py in sys.path

# 2- rel_imports/src is the first element of the list

# 3 - when ran from src i.e cd src Python intro.py only rel_imports/src is the first element of the list

# Conclusion:

# 1- It adds the location where .py is there as the first element then PYTHONPATH 
# then cwd i.e rel_imports if ran from there as python src/intro.py or src if ran from 
# there as cd src Python intro.py

# 2- We can append sys.path with any location we want that gets added at the last or 
# the position defined




