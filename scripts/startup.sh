# Set screenlayout
$HOME/.screenlayout/default.sh

# Set keyboard to qwerty layout with altgr as modifier
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl

# Start audio applications
pulseaudio -D
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
/home/arons/.screenlayout/default.sh
xinput --set-prop 11 303 -0.8

pkill pa-applet
pa-applet &>/dev/null & disown;
pkill nm-applet
nm-applet &>/dev/null & disown;

pkill picom
picom &>/dev/null & disown;
wal -R

