
os=$(uname)

#######################################################################
# prompt
#######################################################################
if [ "$TERM" = "dumb" ] ; then
  PS1="[\u@\h $WINDOW:\w]\n$ "
else
  PS1="\[\033[1;34m\][\u@\h $WINDOW:\w]\n$\[\033[0m\] "
fi

# rvm 情報表示
if [ -e ~/.rvm/bin/rvm-prompt ]; then
  PS1="\$(~/.rvm/bin/rvm-prompt)$PS1"
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
export HISTFILESIZE=100000
export REMOTE_USER_NAME=g-yanagi
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules/
PATH=~/Bin:/usr/local/bin:/usr/bin:/bin
PATH=$PATH:/usr/ant/bin
PATH=$PATH:$NODE_PATH
PATH=$PATH:/usr/local/mysql/bin
PATH=$PATH:$HOME/.rvm/bin
PATH=$PATH:/usr/local/share/npm/bin
export PATH
export PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME%%.*}\007"'

export GOPATH=$HOME/go
export PATH=/usr/local/go/bin:$GOPATH/bin:$PATH

#######################################################################
# aliases
#######################################################################

# 一文字シリーズ
alias b="popd"
alias c="cd"
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

f () {
  find . -type d -name .svn -prune -o -name "$1" -print
}

nkfu () {
   nkf -w -Lm -d $1
}

function ssh_wrapper () {
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

msd () {
  mysql -uroot -e "show databases"
}

mst () {
  mysql $1 -uroot -e "show tables"
}

mss () {
  mysql $1 -uroot -e "select * from $2"
}

loop () {
  while [ true ]; do 
    eval "$1"
    sleep $2
  done
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
