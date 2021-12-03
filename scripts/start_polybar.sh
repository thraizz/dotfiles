#!/bin/bash

killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

laptopDisplay=$(xrandr --query | grep -P '^e.* connected')
if [[ $laptopDisplay ]]; then
  laptop=$(echo $laptopDisplay | cut -d' ' -f1)
  if [[ $(echo $laptopDisplay | grep "primary") ]]; then
    MONITOR=$laptop polybar laptop >>/tmp/polybar.log 2>&1 & disown;
  else
    MONITOR=$laptop polybar secondary-i3 >>/tmp/polybar.log 2>&1 & disown;
  fi
fi

# Get monitors
primary=$(xrandr --query | grep -P '^(?!e).* connected primary' | cut -d' ' -f1)
secondary=$(xrandr --query | grep -P '^(?!e).* connected (?!primary)' | cut -d' ' -f1)

# Launch bars
if [[ $primary ]]; then
  MONITOR=$primary polybar main-i3 >>/tmp/polybar.log 2>&1 & disown;
fi
if [[ $secondary ]]; then
  for monitor in $(xrandr --query | grep -P '^(?!e).* connected (?!primary)' | cut -d' ' -f1); do
    MONITOR=$monitor polybar secondary-i3 >>/tmp/polybar.log 2>&1 & disown;
  done
fi
echo "--- RESTARTED $primary $secondary $laptop ---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
exit 0


