#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
echo "--- RESTARTED ---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar dp1 >>/tmp/polybar.log 2>&1 &
polybar dp4 >>/tmp/polybar.log 2>&1 &
polybar macbook >>/tmp/polybar.log 2>&1 &
