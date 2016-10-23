#!/usr/bin/python2.7

import subprocess



def getUserValue(promptString, createCheckString):
    val = raw_input(promptString)
    valIsOk = raw_input(createCheckString(val))
    while valIsOk.lower().strip() != 'y':
        val = raw_input(promptString)
        valIsOk = raw_input(createCheckString(val))
    return val

email = getUserValue(
    'email (for gitconfig): ',
    lambda em: 'email = "{}" (y/n)? '.format(em),
)


try:
    subprocess.call('git config user.email {}'.format(email), shell=True)
    subprocess.call('git config user.name "Monte Mishkin"', shell=True)
except Exception as ex:
    print('problem with git:')
    raise ex


def createBanner(commentToken, isFooter=False):
    beginOrEnd = 'End' if isFooter else 'Begin'
    midLine = \
        '{0} {1} https://github.com/montemishkin/config-osx installation {0}' \
        .format(commentToken, beginOrEnd)
    outerLine = '{} '.format(commentToken) * (1 + (len(midLine) // 2))
    return '{0}\n{1}\n{0}'.format(outerLine, midLine)



toVimrc = """
{header}

" allow syntax highlighting
syntax on

{footer}
""".format(header=createBanner('"'), footer=createBanner('"', True))


toBashrc = """
{header}

# welcome user
echo "Welcome, I hope you are doing well."

# "list all"
#   `-A`: all except . and ..
#   `-F`: file type indicators
#   `-G`: colorized output
#   `-h`: human readable file sizes
#   `-l`: full info, one per line
alias la='ls -AFGhl'

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

# default text editor
export EDITOR=vim
# enable vi editing commands in bash
set -o vi

# super cool prompt (see http://ezprompt.net/):
# eg: "user@host ~/path/to/you $ "
export PS1="\[\e[36m\]\u\[\e[m\]\[\e[31m\]@\[\e[m\]\[\e[35m\]\h\[\e[m\] \[\e[32m\]\w\[\e[m\] \[\e[31m\]$\[\e[m\] "

{footer}
""".format(header=createBanner('#'), footer=createBanner('#', True))


import os.path

bashrcPath = os.path.expanduser('~/.bashrc')
vimrcPath = os.path.expanduser('~/.vimrc')

def appendStringToFile(string, outFilePath):
    print('appending content to {}'.format(outFilePath))
    outString = '\n{}\n'.format(string)
    try:
        with open(outFilePath, 'a') as outFile:
            outFile.write(outString)
    except IOError:
        with open(outFilePath, 'w') as outFile:
            outFile.write(outString)

appendStringToFile(toBashrc, bashrcPath)
appendStringToFile(toVimrc, vimrcPath)
