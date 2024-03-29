#!/bin/sh
# Set brightness via xbrightness when redshift status changes

# Set brightness values for each status.
# Range from 1 to 100 is valid
brightness_day=100
brightness_transition=50
brightness_night=30
# Set fps for smoooooth transition
fps=1000
# Adjust this grep to filter only the backlights you want to adjust
backlights=($(xbacklight -list | grep ddcci*))

set_brightness() {
	for backlight in "${backlights[@]}"
	do
		xbacklight -set $1 -fps $fps -ctrl $backlight &
	done
}

if [ "$1" = period-changed ]; then
	case $3 in
		night)
		    cp ~/.config/kitty/light.conf ~/.config/kitty/current.conf
			#set_brightness $brightness_night 
			;;
		transition)
			#set_brightness $brightness_transition
			;;
		daytime)
		    cp ~/.config/kitty/dark.conf ~/.config/kitty/current.conf
			#set_brightness $brightness_day
			;;
	esac
fi
