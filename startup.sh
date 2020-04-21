# Set screenlayout
exec --no-startup-id $HOME/.screenlayout/default.sh

# Set keyboard to qwerty layout with altgr as modifier
exec --no-startup-id setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl

# Start audio applications
exec --no-startup-id pulseaudio
exec --no-startup-id pa-applet

# Autostart applications
exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
exec --no-startup-id nitrogen --restore; sleep 1; compton -b
exec --no-startup-id feh --randomize --bg-fill ~/Wallpapers/*
exec --no-startup-id nm-applet
exec --no-startup-id xfce4-power-manager
exec --no-startup-id pamac-tray
exec --no-startup-id clipit
exec --no-startup-id start_conky_maia
exec --no-startup-id xautolock -time 10 -locker blurlock
exec_always --no-startup-id ff-theme-util
exec_always --no-startup-id fix_xcursor
