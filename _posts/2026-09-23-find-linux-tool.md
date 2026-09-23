To search through several directories at one time using the find command, list the directory paths sequentially right after the find keyword, separated by spaces. [1, 2] 
## Basic Syntax
```
find /path/to/dir1 /path/to/dir2 /path/to/dir3 -type f -name "pattern"
```
## Examples


* Search for specific files in multiple specific paths:
```
find /var/log /home/user/logs -type f -name "*.log"
```
* Search inside an array of directories in a Bash script:
```
my_dirs=( "/etc" "/var" "/opt" )
find "${my_dirs[@]}" -type f -name "*.conf"
```
* Exclude subdirectories (stay only in the target folders):
```
find /dir1 /dir2 /dir3 -maxdepth 1 -type f -name "*.txt"
```


If you want to customize this further, let me know:


* Are you looking to exclude specific subdirectories from the search?
* Do you need to execute an action (like delete or copy) on the found files?
  
