# Set screenlayout
$HOME/.screenlayout/default.sh

# Start xscreensaver
xscreensaver & disown;

# Manage i3 layout
python $HOME/scripts/i3-alternating-layout.py & disown;

# Set keyboard and mouse preferences
xmodmap $HOME/.Xmodmap
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
xinput --set-prop "2.4G Mouse" 302 -0.8

# Start audio applications
pulseaudio -D
pkill pa-applet
pa-applet &>/dev/null & disown;


# Start networkmanager applett
pkill nm-applet
nm-applet &>/dev/null & disown;

# Start picom composition manager
pkill picom
picom &>/dev/null & disown;

# Restore pywal settings
wal -R

# Launch polybar
$HOME/.config/polybar/launch.sh
