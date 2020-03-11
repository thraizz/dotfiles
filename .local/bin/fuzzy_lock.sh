#!/bin/sh -e
scrot /tmp/screen_locked.png
mogrify -scale 2% -scale 5000% /tmp/screen_locked.png
i3lock -i /tmp/screen_locked.png
sleep 15
pgrep i3lock && xset dpms force off
