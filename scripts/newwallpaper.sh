#!/bin/zsh
export DISPLAY=:0.0
source /etc/environment
url=$(curl -s "https://api.unsplash.com/photos/random?client_id=$UNSPLASH_TOKEN&collections=11705415,1201327" | jq --raw-output ".urls.full")
curl -s -o $HOME/Wallpapers/current.png $url
feh --bg-fill $HOME/Wallpapers/current.png
