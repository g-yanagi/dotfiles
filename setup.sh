#!/bin/bash

os=$(uname)

DOT_FILES=(.screenrc .gvimrc .tmux.conf .bashrc .bashrc.mac .aspell.conf .spacemacs)

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
