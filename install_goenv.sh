git clone https://github.com/syndbg/goenv.git ~/.goenv

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

arch -arch x86_64 goenv install 1.14.3

goenv global 1.14.3

