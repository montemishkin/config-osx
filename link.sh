#!/bin/bash

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Links up the system to my various configuration files by creating
# symbolic links from the locations known by the system to the
# corresponding files in my config repository. Saves previously existing
# configurations (if any) to the path provided by the first argument to
# the script (defaults to a timestamped directory under `$HOME`).
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


# #
# Helper Functions
# #

# first argument is path where config file is expected to be
# second argument is path where config file actually is
# third argument is path to save old config files to
save_then_link() {
    # if $1 is a directory
    if [ -d "$1" ]; then
        echo "$1 is a directory (no action taken)"
    # otherwise, $1 does not exist or is not a directory
    else
        # if $1 does exist but is not a directory
        if [ -a "$1" ] || [ -h "$1" ]; then
            # if $3 has not been made yet
            if [ ! -d "$3" ]; then
                echo "making directory $3 to save old copies of config files to"
                # make dir to save old config files to
                mkdir -p "$3"
            fi

            echo "saving old copy of $1"
            # copy old config file to dir of saved config files
            cp -R -L "$1" "$3"
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

# if an argument was passed to this script
if [ ! -z "$1" ]; then
    # then use it as the dir to save old config files to
    save_dir="$1"
# no argument passed to script
else
    # use default timestamped path as dir to save old config files to
    save_dir="$HOME/config.$(date +%Y-%m-%d_%H.%M.%S)"
fi

# path to config repository
repo_path="$HOME/mdv/config"

# do the actual linking
save_then_link "$HOME/.bash_profile" "$repo_path/bash/bash_profile.sh" "$save_dir"
save_then_link "$HOME/.gitconfig" "$repo_path/git/gitconfig" "$save_dir"
save_then_link "$HOME/.npmrc" "$repo_path/npm/npmrc" "$save_dir"
save_then_link "$HOME/.vimrc" "$repo_path/vim/vimrc" "$save_dir"
save_then_link "$HOME/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings" "$repo_path/sublime/Preferences.sublime-settings" "$save_dir"
save_then_link "$HOME/Library/Application Support/Sublime Text 2/Packages/MarkdownEditing/Preferences.sublime-settings" "$repo_path/sublime/Markdown.sublime-settings" "$save_dir"
save_then_link "$HOME/Library/Application Support/Sublime Text 2/Packages/User/JavaScript (Babel).sublime-settings" "$repo_path/sublime/JavaScript (Babel).sublime-settings" "$save_dir"

# Handle the special case of my local bin directory.
# What I need to do here is copy things from my local bin directory into
# a bin directory under `$save_dir`.  If the thing in my local bin
# is a script, it should be copied entirely, but if it is a link then it
# should just be copied as a link (not followed).
echo "making directory $save_dir/bin to save old copies of $HOME/bin files to"
echo "links in $HOME/bin will be copied, but not followed"
mkdir "$save_dir/bin"
for exe_path in $HOME/bin/*; do
    echo "saving old copy of $exe_path"
    cp -R "$exe_path" "$save_dir/bin/"
done
