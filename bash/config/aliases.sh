# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Defines all my silly bash aliases.
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


# "list all"
#   `-A`: all except . and ..
#   `-F`: file type indicators
#   `-G`: colorized output
#   `-h`: human readable file sizes
#   `-l`: full info, one per line
alias la='ls -AFGhl'


# "tree list"
#   `-a`: all except . and ..
#   `-p`: show file permissions
#   `-F`: file type indicators
#   `-C`: colorized output
#
alias tl='tree -pFC'


# "raspberry pi": ssh to raspberry pi
alias rpi='ssh pi@10.0.0.29'
# "raspberry pi scan": scan for open IP addresses to find the raspberry pi
#   `-p 22 --open`: scan for open port 22's
#   `-sV`: probe open ports to determine service/version info
#   `192.168.0-3.0-20`: the range of IP addresses to scan
alias rpi-scan='nmap -p 22 --open -sV 192.168.0-3.0-20'


# "encode": encode file (e.g. `enc -in infile.txt -out oufile.enc`)
alias enc='openssl aes-256-cbc -a'
# "decode": decode file (e.g. `dec -in infile.enc -out oufile.txt`)
alias dec='openssl aes-256-cbc -a -d'


# "git status"
alias gs='git status'
# "git diff"
alias gd='git diff'
# "git log"
#   `--oneline`: show short message only, one per line
#   `-n 10`: only show 10 most recent commits
alias gl='git log --oneline -n 10'
# "git graph"
#   `--oneline`: show short message only, one per line
#   `--graph`: show history in branch network graph style
#   `--all`: show commits from all branches (including those not related to current branch)
#   `-n 10`: only show 10 most recent commits
alias gg='git log --oneline --graph --all -n 10'
# "git add"
alias ga='git add'
# "git commit"
#   `-m`: message (follow with the commit message)
alias gc='git commit -m'

# blender
alias blender='/Applications/blender.app/Contents/MacOS/blender'


# end of file
