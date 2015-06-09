# dotfiles

My configuration files for things like bash and vim.


## Quickstart

To get up and running with these configuration files, clone this repository into `$HOME/mdv/dotfiles`, `cd` into that directory, and then run `link.sh`.


## link.sh

Running this script links up the system to my various configuration files.  It does so by creating symbolic links from the locations known by the system to the corresponding files in my dotfiles repository.

Don't worry, it will save previously existing configurations (if any) to the folder path provided by the first argument to the script (which defaults to a timestamped directory under `$HOME`).
