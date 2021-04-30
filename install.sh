#! /bin/bash

# Create directories
mkdir -p ~/.config
mkdir -p ~/.vim/colors
mkdir -p ~/.dwm
mkdir -p ~/.local/bin/statusbar


# zsh files
cp .zshenv ~/
cp .zshrc ~/


# vim files
cp .vimrc ~/
curl https://raw.githubusercontent.com/ozkanonur/nimda-vim/master/colors/nimda.vim --output ~/.vim/colors/nimda.vim


# x files
cp .xsession ~/


# dwm files
cp .dwm/* ~/.dwm/
cp .local/bin/statusbar/* ~/.local/bin/statusbar/


# config files
cp .config/* ~/.config/


# other
cp .bash_profile ~/
cp .firewatch-dark.jpg ~/
cp .local/bin/screen_switcher ~/.local/bin/
