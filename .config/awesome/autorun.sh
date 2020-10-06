pkill picom
pkill nm-applet
pkill pa-applet & sleep 1;
# Set screenlayout
$HOME/.screenlayout/default.sh

# Start xscreensaver
xscreensaver & disown;

# Set keyboard and mouse preferences
xmodmap $HOME/.Xmodmap
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
xinput --set-prop "2.4G Mouse" 299 -0.8

# Start audio applications
pa-applet &>/dev/null & disown;

# Start networkmanager applett
nm-applet &>/dev/null & disown;

# Start picom composition manager
picom &>/dev/null & disown;

# Restore pywal settings
feh --bg-fill $HOME/Wallpapers/current.png

# Mpris Proxy
mpris-proxy &>/dev/null & disown;
