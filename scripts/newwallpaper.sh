#!/bin/zsh
export DISPLAY=:0.0
curl -L -o $HOME/Wallpapers/current.png "https://source.unsplash.com/random?nature/2560x1440" 
wal -i $HOME/Wallpapers/current.png --saturate 1 -e
