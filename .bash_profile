# Ensure that the homebrew directory is at the top of the path
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/python:/usr/local/Cellar/go/1.2.1/bin:$PATH

# Set the Python Path environment variables
export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH

# Allow kdiff3 to be launched from the CLI
alias kdiff3='/Applications/kdiff3.app/Contents/MacOS/kdiff3'

# Enable color terminal markup
alias ls='ls -G'
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# VIM is the editor of choice
export EDITOR=vim

# Vi shortcuts in the terminal
set -o vi

function parse_git_branch {
    # show branch in shell prompt
   ref=$(git symbolic-ref HEAD 2> /dev/null) || return
   BRANCH=""${ref#refs/heads/}""
   if [ "$BRANCH" == "master" ]; then
       echo "($(tput setaf 1)${BRANCH}$(tput sgr0))";
   elif [ "$BRANCH" == "develop" ]; then
       echo "($(tput setaf 3)${BRANCH}$(tput sgr0))";
   elif [[ "$BRANCH" == "feature"* ]]; then
        echo "($(tput setaf 2)${BRANCH}$(tput sgr0))";
   elif [[ "$BRANCH" == "release"* ]]; then
       echo "($(tput setaf 5)${BRANCH}$(tput sgr0))";
   else
       echo  "(${BRANCH})"
   fi

}

genpasswd() {
    local l=$1
    [ "$l" == "" ] && l=16
    LC_CTYPE=C tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}

function _update_ps1() {
    export PS1="$(~/dotfiles/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}

export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
