export PATH=/opt/local/bin:$PATH
export PATH=$(brew --prefix curl)/bin:$PATH

# set the number of open files to be 1024
ulimit -S -n 1024
