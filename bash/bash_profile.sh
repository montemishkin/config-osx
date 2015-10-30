# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Bash profile for my OSX machine.
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


# secret environment variables
source "$HOME/.secret.monte"


# path to config repository
repo_path="$HOME/mdv/config-osx"

# monte's custom stuff
source "$repo_path/bash/config/exports.sh"
source "$repo_path/bash/config/aliases.sh"
source "$repo_path/bash/config/setopts.sh"
source "$repo_path/bash/config/prompt.sh"
source "$repo_path/bash/config/completion.sh"


# end of file
