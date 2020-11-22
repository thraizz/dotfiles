#!/bin/bash
DISPLAY=":0.0"
cp $HOME/.config/kitty/light.conf $HOME/.config/kitty/current.conf
feh --bg-fill --randomize ~/Wallpapers/Light/*
wal --theme base16-gruvbox-hard -l
pywalfox update
