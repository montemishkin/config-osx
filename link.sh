#!/bin/bash

# Links up the system to my various configuration files
# by creating symbolic links from the locations known by
# the system to the corresponding files in my dotfiles
# repository.
# Saves previously existing configurations (if any) to
# the path provided by the first argument to the script
# (defaults to a timestamped directory under `$HOME`).


# if an argument was passed to this script
if [ ! -z $1 ]; then
    # then use it as the dir to save old config files to
    save_dir=$1
# no argument passed to script
else
    # use default timestamped path as dir to save old config files to
    save_dir=$HOME/.config.$(date +%Y-%m-%d_%H.%M.%S)
fi


# first argument is path where config file is expected to be
# second argument is path where config file actually is
copy_and_link() {
    # if $1 is a directory
    if [ -d $1 ]; then
        echo "$1 is a directory (no action taken)"
    # otherwise, $1 does not exist or is not a directory
    else
        # if $1 does exist but is not a directory
        if [ -a $1 ]; then
            # if $save_dir has not been made yet
            if [ ! -d save_dir ]; then
                echo "creating directory $save_dir to save old copies of config files to"
                # make dir to save old config files to
                mkdir -p $save_dir
            fi

            echo "saving old copy of $1 in $save_dir"
            # copy old config file to dir of saved config files
            cp -R -L $1 $save_dir
            # remove old config file from original location
            rm $1
        fi

        echo "creating link: $1 -> $2"
        # create link to new config file
        ln -s $2 $1
    fi
}


dotfiles=$HOME/mdv/dotfiles

copy_and_link $HOME/.bash_boi $dotfiles/bash/bash_profile.sh

# copy_and_link $HOME/.bash_profile $dotfiles/bash/bash_profile.sh
# copy_and_link $HOME/.gitconfig $dotfiles/git/gitconfig
# copy_and_link $HOME/.npmrc $dotfiles/npm/npmrc
# copy_and_link $HOME/.vimrc $dotfiles/vim/vimrc
# copy_and_link $HOME/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings $dotfiles/sublime/Preferences.sublime-settings
