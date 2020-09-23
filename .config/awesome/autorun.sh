#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}
# Set screenlayout
$HOME/.screenlayout/default.sh

# Start xscreensaver
run xscreensaver

# Set keyboard and mouse preferences
xmodmap $HOME/.Xmodmap
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
xinput --set-prop "2.4G Mouse" 299 -0.8

# Start audio applications
run pa-applet

# Start networkmanager applett
run nm-applet

# Start picom composition manager
run picom

# Restore pywal settings
wal -R
