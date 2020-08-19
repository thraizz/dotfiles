picture=$(shuf -n1 -e ~/Wallpapers/*); feh --bg-fill $picture; ./get_colors.py $picture; cat ~/.config/i3/colors ~/.config/i3/base > ~/.config/i3/config && i3-msg reload --quiet; cat ~/.config/xfce4/terminal/base ~/.config/xfce4/terminal/colors > ~/.config/xfce4/terminal/terminalrc

