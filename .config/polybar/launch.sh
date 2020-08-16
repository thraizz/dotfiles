#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
echo "--- RESTARTED ---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
if [[ $DESKTOP_SESSION == "openbox" ]]; then
    polybar dp1-ewmh >>/tmp/polybar.log 2>&1 & disown;
    polybar dp4-ewmh >>/tmp/polybar.log 2>&1 & disown;
else
    polybar dp1-i3 >>/tmp/polybar.log 2>&1 & disown;
    polybar dp4-i3 >>/tmp/polybar.log 2>&1 & disown;
fi
MONITOR=$(xrandr --query | grep primary | grep -Eo '^e[^ ]+') polybar laptop >>/tmp/polybar.log 2>&1 & disown;
