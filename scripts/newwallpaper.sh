#!/bin/bash
url=$(curl -s "https://api.unsplash.com/photos/random?client_id=daYXaH70NsAGQzapSFmlWQ-kp4tRKFWtK5yItwMPsMY&query=nature&orientation=landscape&featured=true" | jq --raw-output ".urls.raw")
curl -s -o $HOME/Wallpapers/current.png $url
wal -i $HOME/Wallpapers/current.png --saturate 1
