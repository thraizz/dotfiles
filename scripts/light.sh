#!/bin/bash
DISPLAY=":0.0"
feh --bg-fill --randomize ~/Wallpapers/Light/*
wal --theme base16-gruvbox-hard -l
cp $HOME/.cache/wal/colors-kitty.conf ~/.config/kitty/current.conf
