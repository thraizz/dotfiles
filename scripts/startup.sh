#!/bin/bash
# Startup script

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# Set screenlayout
$HOME/.screenlayout/default.sh

# Start xscreensaver
pkill xscreensaver
xscreensaver & disown;

# Set keyboard and mouse preferences
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
xmodmap $HOME/.Xmodmap
xbindkeys --poll-rc -f $HOME/.xbindkeysrc


# Start flameshot
flameshot &>/dev/null & disown;

## Start picom
#pkill picom
#picom & disown;

# Restore pywal settings
feh --bg-fill --randomize $HOME/assets/Wallpapers/current/*

# Start polybar
$HOME/scripts/start_polybar.sh;
