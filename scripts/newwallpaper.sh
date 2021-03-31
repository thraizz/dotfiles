#!/bin/zsh
export DISPLAY=:0.0
source /etc/environment
url=$(curl -s "https://api.unsplash.com/photos/random" | jq --raw-output ".urls.full")
curl -s -o $HOME/Wallpapers/current.png $url
feh --bg-fill $HOME/Wallpapers/current.png
