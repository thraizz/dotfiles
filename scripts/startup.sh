pkill picom
pkill nm-applet
pkill pa-applet & sleep 1;
# Set screenlayout
$HOME/.screenlayout/default.sh

# Start xscreensaver
xscreensaver & disown;

# Set keyboard and mouse preferences
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
xmodmap $HOME/.Xmodmap
pulseaudio --start

# Start audio applications
pa-applet &>/dev/null & disown;

# Start networkmanager applett
nm-applet &>/dev/null & disown;

# Start picom composition manager
picom &>/dev/null & disown;

# Start alternating layout
python3 $HOME/scripts/i3-alternating-layout.py & disown;

# Restore pywal settings
feh --bg-fill $HOME/Wallpapers/current.png

# Launch polybar
$HOME/.config/polybar/launch.sh

xbindkeys --poll-rc -f $HOME/.xbindkeysrc
