#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
echo "--- RESTARTED ---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
if [[ "$HOSTNAME" == "aron-ms7c37" ]]; then
    if [[ "$DESKTOP_SESSION" == "i3" ]]; then
        polybar dp1-i3 >>/tmp/polybar.log 2>&1 & disown;
        polybar dp4-i3 >>/tmp/polybar.log 2>&1 & disown;
    elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
            polybar dp1-bspwm >>/tmp/polybar.log 2>&1 & disown;
            polybar dp4-bspwm >>/tmp/polybar.log 2>&1 & disown;
    fi
else
    polybar macbook >>/tmp/polybar.log 2>&1 &
fi
