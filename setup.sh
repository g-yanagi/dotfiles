#!/bin/bash

os=$(uname)

DOT_FILES=( .emacs.d .screenrc .vimrc .gvimrc .tmux.conf .bashrc )

for file in ${DOT_FILES[@]}
do
    if [ ! -e $HOME/$file ]
    then
      ln -s $HOME/dotfiles/$file $HOME/$file
    fi
done

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
  # Ricty font の install
  brew tap sanemat/font
  brew install ricty

  cmd=$(brew info ricty | grep "Ricty\*.ttf" | sed -e "s/.*\(cp -f.*\)/\1/")
  eval $cmd

  git clone https://github.com/Lokaltog/vim-powerline ~/.vim-powerline
  fontforge -lang=py -script ~/.vim-powerline/fontpatcher/fontpatcher ~/Library/Fonts/Ricty-Regular.ttf

  mv -f *.ttf ~/Library/Fonts/

  # wait a minute
  fc-cache -vf
fi
