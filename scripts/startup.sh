# Set screenlayout
$HOME/.screenlayout/default.sh

# Set keyboard to qwerty layout with altgr as modifier
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl

# Start audio applications
pulseaudio -D
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
/home/arons/.screenlayout/default.sh
xinput --set-prop 11 303 -0.8

pa-applet &>/dev/null & disown;
nm-applet &>/dev/null & disown;

picom &>/dev/null & disown;
wal -R

