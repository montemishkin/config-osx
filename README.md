# config-osx

Dotfiles and other configuration for my OSX machine.


## Quickstart

To get up and running with these configuration files:

1. Clone this repository into `$HOME/mdv/config-osx`
1. `cd` into that directory
1. Run `link.sh`

It's as easy as that! Almost...

### Requirements

This quickstart will fail if the system you are trying to get up and running on does not meet any of the following requirements:

- system must expect the files to be at the locations where `link.sh` puts links to them (duh)
- as of right now, this repository **must** be cloned to `$HOME/mdv/config-osx`
- you will see an (unproblematic) error if you do not have homebrew installed (when it tries to source the homebrew bash completion script)
- `python3` must be installed at `/usr/local/bin/python3`
    + `pip3` must be installed at `/usr/local/bin/pip3`
    + `virtualenvwrapper.sh` must be installed **for python3** at `/usr/local/bin/virtualenvwrapper.sh`
- `python2.7` must be installed at `/usr/local/bin/python2.7` (or does it?)
- Probably some more stuff I can't think of right now... I'll fix that one day.


## link.sh

Running this script links up the system to my various configuration files.  It does so by creating symbolic links from the locations known by the system to the corresponding files in my config repository.

Don't worry, it will save previously existing configurations (if any) to the folder path provided by the first argument to the script (which defaults to a timestamped directory under `$HOME`).
