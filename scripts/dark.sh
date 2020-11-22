#!/bin/bash
DISPLAY=":0.0"
export DARK='True'
cp $HOME/.config/kitty/dark.conf $HOME/.config/kitty/current.conf
cp $HOME/.config/nvim/colors/gruvbox.vim $HOME/.vim/colors/current.vim
feh --bg-fill --randomize /home/dubai/Wallpapers/Dark/*
wal --theme base16-gruvbox-hard
