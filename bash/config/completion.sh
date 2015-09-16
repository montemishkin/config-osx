# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Loads all bash completion files.
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


# homebrew tab completion
source /usr/local/Library/Contributions/brew_bash_completion.sh

# gulp tab completion
eval "$(gulp --completion=bash)"

# various tab completions (npm, git, etc) installed by homebrew
for completion_file in /usr/local/etc/bash_completion.d/*; do
    source $completion_file
done


# end of file
