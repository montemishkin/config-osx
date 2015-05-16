# Setting PATH for Python 3.4
export PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"

# MacPorts Installer addition on 2015-02-07_at_23:42:24: 
#   adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:/Users/montemishkin/tools/bin:$PATH"

# virtualenvwrapper settings
source /opt/local/Library/Frameworks/Python.framework/Versions/3.4/bin/virtualenvwrapper.sh

# local node bin
export PATH="$HOME/.node/bin:$PATH"

# prepend monte's personal bin
export PATH="$HOME/bin:$PATH"
