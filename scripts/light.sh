#!/bin/bash
DISPLAY=":0.0"
rm -r ~/assets/Wallpapers/current
ln -s ~/assets/Wallpapers/Light ~/assets/Wallpapers/current
feh --bg-fill --randomize ~/assets/Wallpapers/current
wal --theme base16-google -l
rm ~/.config/kitty/current.conf
ln -s ~/.cache/wal/colors-kitty.conf ~/.config/kitty/current.conf
kitty @ --to=unix:/tmp/kitty set-colors -a "~/.config/kitty/current.conf"
rm $HOME/.config/nvim/colors/current.vim
ln -s $HOME/.config/nvim/colors/base16-google-light.vim $HOME/.config/nvim/colors/current.vim
