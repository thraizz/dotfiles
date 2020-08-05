# Set screenlayout
$HOME/.screenlayout/default.sh

# Set keyboard to qwerty layout with altgr as modifier
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl

# Start audio applications
pulseaudio -D
DISPLAY=:0.0 xscreensaver-systemd & disown;
xinput --set-prop 11 303 -0.8

pkill pa-applet
pa-applet &>/dev/null & disown;
pkill nm-applet
nm-applet &>/dev/null & disown;

pkill picom
picom &>/dev/null & disown;
wal -R
$HOME/.config/polybar/launch.sh
