#!/bin/bash

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
fi

# Ricty font の install
brew tap sanemat/font
brew install ricty

cmd=$(brew info ricty | grep "Ricty\*.ttf" | sed -e "s/.*\(cp -f.*\)/\1/")
echo $cmd
eval $cmd
