
os=$(uname)

#######################################################################
# prompt
#######################################################################
if [ "$TERM" = "dumb" ] ; then
  PS1="[\u@\h $WINDOW:\w]\n$ "
else
  PS1="\[\033[1;34m\][\u@\h $WINDOW:\w]\n$\[\033[0m\] "
fi

#######################################################################
# environmental variables
#######################################################################
export EDITOR=vi
export ANT_OPTS=-Dfile.encoding=UTF8
export SVN_EDITOR="vim --noplugin"
export HISTFILESIZE=100000
export REMOTE_USER_NAME=g-yanagi
if [ $os = "Darwin" ]; then
  export JAVA_HOME=`/usr/libexec/java_home`
fi
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules/
PATH=~/Bin:/usr/local/bin:/usr/bin:/bin
if [ $os = "Darwin" ]; then
  PATH=$PATH:$(brew --prefix coreutils)/libexec/gnubin
fi
PATH=$PATH:$NODE_PATH
PATH=$PATH:/usr/local/mysql/bin
PATH=$PATH:/Library/Frameworks/JRuby.framework/Versions/Current/bin
PATH=$PATH:$HOME/.rvm/bin
PATH=$PATH:/usr/local/share/npm/bin
PATH=$PATH:$(gem env | grep "EXECUTABLE DIRECTORY" | awk '{print $4}')
export PATH
export PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME%%.*}\007"'

#######################################################################
# aliases
#######################################################################
alias ll="ls -l"
alias hosts="cat /etc/hosts"
alias vhosts="sudo vi /etc/hosts"
alias cf='coffee'
alias snv="svn"
alias sst="svn status"
alias sup="svn update"
alias sdi="svn diff"
alias sci="svn ci"
alias slog="svn log"
alias slogs="svn log --stop-on-copy"
alias start_rvm='source ~/.rvm/scripts/rvm'
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias at="screen -r"
if [ $os = "Darwin" ]; then
  alias find="gfind"
  alias ls="gls --color=auto"
  alias start_mongo="launchctl load /usr/local/Cellar/mongodb/2.4.4-x86_64/homebrew.mxcl.mongodb.plist"
  alias stop_mongo="launchctl unload /usr/local/Cellar/mongodb/2.4.4-x86_64/homebrew.mxcl.mongodb.plist"
  alias start_mysql="launchctl load /usr/local/opt/mysql/homebrew.mxcl.mysql.plist"
  alias stop_mysql="launchctl unload /usr/local/opt/mysql/homebrew.mxcl.mysql.plist"
  alias seq="jot"
fi

#######################################################################
# functions
#######################################################################

uu () {
  for i in `seq 1 $1` ; do
    pwd
    cd ..
  done
}

function fd () {
  find . -type d -name .svn -prune -o -not -name "*~" -exec grep -H $1 {} \;
}

function f () {
  find . -type d -name .svn -prune -o -name "$1" -print
}

function nkfu () {
  nkf --ic=CP932 --oc=UTF-8 $1
}

function s () {
  ssh -A ${REMOTE_USER_NAME}@$1
}

function sc () {
    argv=("$@")
    c=`expr $# - 1`
    for i in `seq 1 $c`
    do
        echo ">> rsync -av $1 ${REMOTE_USER_NAME}@${argv[$i]}:~/"
        rsync -av $1 ${REMOTE_USER_NAME}@${argv[$i]}:~/
    done
}

function scc () {
    argv=("$@")
    c=`expr $# - 1`
    for i in `seq 1 $c`
    do
        echo  ">> ssh -A ${REMOTE_USER_NAME}@${argv[$i]} $1"
        ssh -A ${REMOTE_USER_NAME}@${argv[$i]} $1
    done
}

if [ $os = "Darwin" ]; then
  eval `dircolors ~/.dir_colors -b`
  unset DYLD_LIBRARY_PATH
fi

SOCK="/tmp/ssh-agent-$USER"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
  rm -f $SOCK
  ln -sf $SSH_AUTH_SOCK $SOCK
  export SSH_AUTH_SOCK=$SOCK
fi

if [ -f ~/.bashrc.local ]; then
  . ~/.bashrc.local
fi
