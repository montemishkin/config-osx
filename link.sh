#!/bin/bash

# Links up the system to my various configuration files
# by creating symbolic links from the locations known by
# the system to the corresponding files in my config
# repository.
# Saves previously existing configurations (if any) to
# the path provided by the first argument to the script
# (defaults to a timestamped directory under `$HOME`).


# if an argument was passed to this script
if [ ! -z "$1" ]; then
    # then use it as the dir to save old config files to
    save_dir="$1"
# no argument passed to script
else
    # use default timestamped path as dir to save old config files to
    save_dir="$HOME/config.$(date +%Y-%m-%d_%H.%M.%S)"
fi

# #
# Helper Functions
# #

# first argument is path where config file is expected to be
# second argument is path where config file actually is
save_then_link() {
    # if $1 is a directory
    if [ -d "$1" ]; then
        echo "$1 is a directory (no action taken)"
    # otherwise, $1 does not exist or is not a directory
    else
        # if $1 does exist but is not a directory
        if [ -a "$1" ] || [ -h "$1" ]; then
            # if $save_dir has not been made yet
            if [ ! -d "$save_dir" ]; then
                echo "making directory $save_dir to save old copies of config files to"
                # make dir to save old config files to
                mkdir -p "$save_dir"
            fi

            echo "saving old copy of $1"
            # copy old config file to dir of saved config files
            cp -R -L "$1" "$save_dir"
            # remove old config file from original location
            rm "$1"
        fi

        echo "creating link: $1 -> $2"
        # create link to new config file
        ln -s "$2" "$1"
    fi
}


# #
# Main Script
# #


# path to config repository
repo_path="$HOME/mdv/config"

# do the actual linking
save_then_link "$HOME/.bash_profile" "$repo_path/bash/bash_profile.sh"
save_then_link "$HOME/.gitconfig" "$repo_path/git/gitconfig"
save_then_link "$HOME/.npmrc" "$repo_path/npm/npmrc"
save_then_link "$HOME/.vimrc" "$repo_path/vim/vimrc"
save_then_link "$HOME/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings" "$repo_path/sublime/Preferences.sublime-settings"
