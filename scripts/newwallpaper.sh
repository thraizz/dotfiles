#!/bin/zsh
export DISPLAY=:0.0
source /etc/environment
url=$(curl -s "https://api.unsplash.com/photos/random?client_id=$UNSPLASH_TOKEN&collections=219941,9827255,1201327&orientation=landscape" | jq --raw-output ".urls.raw")
curl -s -o $HOME/Wallpapers/current.png $url
wal -i $HOME/Wallpapers/current.png --saturate 1 -e
