#!/bin/sh

loop=1
while [ "$loop" -eq 1 ]
do

loop=0
typechoice="$(echo "selection\nfull\nwindow" | rofi -dmenu -i -p Screenshot)"

case "$typechoice" in
        "")
                exit ;;
        "selection")
                copychoice="$(echo "yes\nno\nback" | rofi -dmenu -i -p "Copy to clipboard?")"
                case "$copychoice" in
                        "")
                                exit ;;
                        "yes")
                                scrot -s $HOME/screenshots/Screenshot-$(date +%s).png -e 'xclip -selection c -t image/png < $f' ;;
                        "no")
                                scrot -s $HOME/screenshots/Screenshot-$(date +%s).png ;;
                        "back")
                                loop=1 ;;
                esac ;;
        "full")
                copychoice="$(echo "yes\nno\nback" | rofi -dmenu -i -p "Copy to clipboard?")"
                case "$copychoice" in
                        "")
                                exit ;;
                        "yes")
                                scrot $HOME/screenshots/Screenshot-$(date +%s).png -e 'xclip -selection c -t image/png < $f' ;;
                        "no")
                                scrot $HOME/screenshots/Screenshot-$(date +%s).png ;;
                        "back")
                                loop=1 ;;
                esac ;;
        "window")
                copychoice="$(echo "yes\nno\nback" | rofi -dmenu -i -p "Copy to clipboard?")"
                case "$copychoice" in
                        "")
                                exit ;;
                        "yes")
                                scrot -u $HOME/screenshots/Screenshot-$(date +%s).png -e 'xclip -selection c -t image/png < $f' ;;
                        "no")
                                scrot -u $HOME/screenshots/Screenshot-$(date +%s).png ;;
                        "back")
                                loop=1 ;;
                esac ;;
esac

done
