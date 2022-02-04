#!/bin/bash
DISPLAY=":0.0"
export DARK='True'
rm -r ~/assets/Wallpapers/current
ln -fs ~/assets/Wallpapers/Dark ~/assets/Wallpapers/current
feh --bg-fill --randomize ~/assets/Wallpapers/current
wal --theme base16-gruvbox-hard
rm ~/.config/kitty/current.conf
ln -s ~/.cache/wal/colors-kitty.conf ~/.config/kitty/current.conf
kitty +kitten themes --reload-in=all Dark
rm $HOME/.config/nvim/colors/current.vim
ln -s $HOME/.config/nvim/colors/gruvbox.vim $HOME/.config/nvim/colors/current.vim
