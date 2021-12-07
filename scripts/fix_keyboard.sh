#!/bin/bash

setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
xmodmap $HOME/.Xmodmap
