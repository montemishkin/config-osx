# homebrew tab completion
source /usr/local/Library/Contributions/brew_bash_completion.sh

# gulp tab completion
eval "$(gulp --completion=bash)"

# various tab completions (npm, git, etc) installed by homebrew
source /usr/local/etc/bash_completion.d/*
