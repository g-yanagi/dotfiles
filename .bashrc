#######################################################################
# prompt
#######################################################################
prompt="\e[04m[\u @ \h : \w]\e[00m"
if [ -e ~/.production_env ]
then
    prompt="\e[1;31m\]${prompt}"
elif [ -e ~/.demo_env ] || [ -e ~/.staging_env ]
then
    prompt="\e[1;33m\]${prompt}"
elif [ -e ~/.test_env ]
then
    prompt="\e[1;35m\]${prompt}"
elif [ -e ~/.development_env ]
then
    prompt="\e[1;32m\]${prompt}"
fi

PS1="${prompt}\n$ "

if [ "$TERM" = "dumb" ] ; then
    PS1="[\u@\h $WINDOW:\w]\n$ "
fi

#######################################################################
# environmental variables
#######################################################################


export EDITOR=nvim
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules/:/usr/lib/node_modules/
export HISTSIZE=100000
export HISTCONTROL=ignoreboth
export HISTFILESIZE=1000000
# export GOPATH=$HOME/go

PATH=$HOME/bin:$HOME/Bin:/usr/local/bin:/usr/bin:/bin:$PATH:$HOME/Dropbox/bin
PATH=/usr/ant/bin:$PATH
PATH=$NODE_PATH:$PATH
PATH=/usr/local/share/npm/bin:$PATH
export PATH

#######################################################################
# aliases
#######################################################################

# 一文字シリーズ
alias b="popd"
alias c="cd"
alias d="dirs"
alias f="pushd"
alias g="git"
alias h="ssh_wrapper"
alias l="ls"
alias m="man"
alias s="sudo"
alias v="nvim"
alias r="rsync"
alias p="ps aux | grep"
alias k="kubectl"

alias bashrc=". ~/.bashrc"
alias ls="ls --color"
alias ll="ls -l"
alias hosts="cat /etc/hosts"
alias vhosts="sudo vi /etc/hosts"
alias sdiff="svn diff | vim -R -"
alias start_rvm='source ~/.rvm/scripts/rvm'
alias portcheck="sudo netstat -anp"
alias vi="vim -u NONE --noplugin"
alias gs="git status"
alias gb="git branch"
alias gu="git up"
alias gd="git diff"
alias gc="git checkout"
alias gco="git checkout"
alias gl="git log"
alias ga="git add"
alias gm="git commit"
alias gcm="git commit"
alias gp="git push"
alias gpo="git push origin"
alias gcom="git checkout master"

alias h1="head -n 10"
alias h2="head -n 20"
alias h3="head -n 30"
alias h4="head -n 40"
alias h5="head -n 50"

alias a1="awk '{print "'$1'"}'"
alias a2="awk '{print "'$2'"}'"
alias a3="awk '{print "'$3'"}'"
alias a4="awk '{print "'$4'"}'"
alias a5="awk '{print "'$5'"}'"

#######################################################################
# functions
#######################################################################

SOCK="/tmp/ssh-agent-$USER"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
  rm -f $SOCK
  ln -sf $SSH_AUTH_SOCK $SOCK
  export SSH_AUTH_SOCK=$SOCK
fi

#######################################################################
# Read other configuration files
#######################################################################

# source todo_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

## nodejs
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#nvm use

## golang
#export PATH="$HOME/.goenv/bin:$PATH"
#export GOENV_DISABLE_GOPATH=1
#eval "$(goenv init -)"

## pyenv


if [ -f ~/.bashrc.mac ]; then
  . ~/.bashrc.mac
fi

if [ -f ~/.bashrc.local ]; then
  . ~/.bashrc.local
fi

export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# eval "$(starship init bash)"

. "$HOME/.cargo/env"
