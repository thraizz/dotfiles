#!/bin/bash

# Script that gets executed at the start of the WM

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

pkill picom
pkill xscreensaver
# Set screenlayout
$HOME/.screenlayout/default.sh

# Start xscreensaver
xscreensaver & disown;

# Set keyboard and mouse preferences
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
xmodmap $HOME/.Xmodmap
xbindkeys --poll-rc -f $HOME/.xbindkeysrc


# Start flameshot
flameshot &>/dev/null & disown;

# Start picom
picom & disown;

# Restore pywal settings
feh --bg-fill $HOME/assets/wallpaper.jpg

# Start polybar
$HOME/scripts/start_polybar.sh;
