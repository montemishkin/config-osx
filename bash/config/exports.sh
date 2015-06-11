# default text editor
export EDITOR=vim


# #
# PATH settings
# #

# prepend local node bin
export PATH="$HOME/.node/bin:$PATH"
# prepend user's personal bin
export PATH="$HOME/bin:$PATH"


# #
# Virtual Environment Wrapper settings
# #

# the directory to store virtual environments and other settings in
export WORKON_HOME="$HOME/.virtualenvs"
# the directory where your projects will go (it is not vital to set this)
export PROJECT_HOME="$HOME/mdv"
# the python executable to run virtualenvwrapper with
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
# the actual virtualenvwrapper script
source /usr/local/bin/virtualenvwrapper.sh
