#!/bin/bash

DOT_FILES=( .emacs.d .screenrc .vimrc .gvimrc .tmux.conf .bashrc )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
