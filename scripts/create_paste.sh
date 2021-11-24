#!/bin/bash

URL="YOURDOMAIN"
NAME=$(head -1 <(fold -w 20  <(tr -dc 'a-zA-Z0-9' < /dev/urandom)))
xclip -selection clipboard -o > /tmp/$NAME
scp /tmp/$NAME pastes:/opt/docker/nginx/pastes
echo "$URL$NAME" | xclip -selection clipboard -i

