
os=$(uname)

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

if [ -e /usr/ant/bin/ant ]; then
  export ANT_HOME=/usr/ant
fi
export ANT_OPTS=-Dfile.encoding=UTF8
export EDITOR=vi
export SVN_EDITOR="vim --noplugin"
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules/:/usr/lib/node_modules/
export HISTCONTROL=ignoreboth
export HISTFILESIZE=1000000
# export GOPATH=$HOME/go

PATH=$HOME/bin:$HOME/Bin:/usr/local/bin:/usr/bin:/bin:$PATH
PATH=/usr/ant/bin:$PATH
PATH=$NODE_PATH:$PATH
PATH=/usr/local/mysql/bin:$PATH
PATH=/usr/local/share/npm/bin:$PATH
# PATH=/usr/local/go/bin:$GOPATH/bin:$PATH
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
alias v="vim"
alias r="rsync"
alias p="ps aux | grep"

alias bashrc=". ~/.bashrc"
alias vimrc=". ~/.vimrc"
alias gvimrc=". ~/.gvimrc"
alias ll="ls -l"
alias hosts="cat /etc/hosts"
alias vhosts="sudo vi /etc/hosts"
alias cf='coffee'
alias snv="svn"
alias ci="svn ci"
alias co="svn co"
alias up="svn update"
alias st="svn status"
alias log="svn log"
alias sdiff="svn diff | vim -R -"
alias start_rvm='source ~/.rvm/scripts/rvm'
alias at="screen -r"
alias portcheck="sudo netstat -anp"
alias vi="vim -u NONE --noplugin"
alias neobundleupdate="~/.vim/bundle/neobundle.vim/bin/neoinstall"

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

uu () {
  for i in `seq 1 $1` ; do
    pwd
    cd ..
  done
}

fd () {
  find . -type d -name .svn -prune -o -not -name "*~" -exec grep -H $1 {} \;
}

nkfu () {
   nkf -w -Lm -d $1
}

ssh_wrapper () {
  ssh -A ${REMOTE_USER_NAME}@$1
}

sc () {
    argv=("$@")
    c=`expr $# - 1`
    for i in `seq 1 $c`
    do
        echo ">> rsync -av $1 ${REMOTE_USER_NAME}@${argv[$i]}:~/"
        rsync -av $1 ${REMOTE_USER_NAME}@${argv[$i]}:~/
    done
}

scc () {
    argv=("$@")
    c=`expr $# - 1`
    for i in `seq 1 $c`
    do
        echo  ">> ssh -A ${REMOTE_USER_NAME}@${argv[$i]} $1"
        ssh -A ${REMOTE_USER_NAME}@${argv[$i]} $1
    done
}

init () {
  sudo /etc/init.d/$1 $2
}

renv () {
  start_rvm
  rvm use $1
  rvm gemset use $2
}

loop () {
  while [ true ]; do 
    eval "$1"
    sleep $2
  done
}

line () {
    if (( $# == 2 ))
    then
        cat $1 | head -n $2 | tail -n 1
    else
        cat $1 | tail -n 1
    fi
}

sclcmd () {
    scl enable devtoolset-2 "$1"
}


SOCK="/tmp/ssh-agent-$USER"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
  rm -f $SOCK
  ln -sf $SSH_AUTH_SOCK $SOCK
  export SSH_AUTH_SOCK=$SOCK
fi

if [ $os = "Darwin" ]; then
  . ~/.bashrc.mac
fi

if [ -f ~/.bashrc.local ]; then
  . ~/.bashrc.local
fi

# source todo_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
