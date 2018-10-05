#!/bin/bash

os=$(uname)

DOT_FILES=(.screenrc .vimrc .gvimrc .tmux.conf .bashrc .bashrc.mac .aspell.conf .spacemacs)

for file in ${DOT_FILES[@]}
do
    if [ ! -e $HOME/$file ]
    then
      ln -s $HOME/dotfiles/$file $HOME/$file
    fi
done

if [ ! -e $HOME/.emacs.d ]
then
    mkdir $HOME/.emacs.d
    ln -s $HOME/dotfiles/.emacs.d/init.el  $$HOME/.emacs.d/init.el
fi

if [ ! -e ~/.vim/bundle ]
then
  mkdir -p ~/.vim/bundle
  mkdir -p ~/.vim/vim_backup
  mkdir -p ~/.vim/vim_swap
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc
  if [ $os = "Linux" ]
  then
    cd ~/.vim/bundle/vimproc
    make -f make_unix.mak
    cd
  fi
fi

if [ ${os} = "Darwin" ]
then

  # brew を install
  which brew > /dev/null
  if [ $? -ne 0 ]
  then

    echo "install brew"

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  else

    echo "brew exists"

  fi

  # Ricty font の install
  brew info ricty > /dev/null
  if [ $? -ne 0 ]
  then

    echo "install ricty font"

    brew tap sanemat/font

    brew install ricty

    cmd=$(brew info ricty | grep "Ricty\*.ttf" | sed -e "s/.*\(cp -f.*\)/\1/")

    eval $cmd

    git clone https://github.com/Lokaltog/vim-powerline ~/.vim-powerline

    fontforge -lang=py -script ~/.vim-powerline/fontpatcher/fontpatcher ~/Library/Fonts/Ricty-Regular.ttf

    mv -f *.ttf ~/Library/Fonts/

    # wait a minute
    fc-cache -vf

  else

    echo "ricty font exists"

  fi

  # fish を install
  which fish > /dev/null
  if [ $? -ne 0 ]
  then

      echo "install fish shell"

      brew install fish

  else

      echo "fish shell exists"

  fi

  grep fish /etc/shells > /dev/null
  if [ $? -ne 0 ]
  then

    echo "add fish shell to /etc/shells"

    sudo ehco "/usr/local/bin/fish" >> /etc/shells

  fi

  if [ "/usr/local/bin/fish" != "${SHELL}" ]
  then

    echo "change shell to fish"

    chsh -s /usr/local/bin/fish

  fi

fi
