#!/bin/bash

DOT_FILES=( .emacs.d .screenrc .vimrc .gvimrc .tmux.conf .bashrc )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done


# Ricty font の install
brew tap sanemat/font
brew install ricty

cmd=$(brew info ricty | grep "Ricty\*.ttf" | sed -e "s/.*\(cp -f.*\)/\1/")
echo $cmd
eval $cmd
