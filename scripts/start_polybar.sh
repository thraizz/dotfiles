#!/bin/bash

killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.5; done

# Get monitors
query=$(xrandr --query)
laptop=$(echo "$query" | grep -P '^e.* connected' | cut -d' ' -f1)
laptopPrimary=$(echo "$query" | grep -P '^e.* connected primary' | cut -d' ' -f1)
primary=$(echo "$query" | grep -P '^(?!e).* connected primary' | cut -d' ' -f1)
secondary=$(echo "$query" | grep -P '^(?!e).* connected (?!primary)' | cut -d' ' -f1)

# Launch bars
if [[ $laptop ]]; then
  if [[ $(echo $laptopPrimary) ]]; then
    MONITOR=$laptop polybar laptop >>/tmp/polybar.log 2>&1 & disown;
  else
    MONITOR=$laptop polybar secondary-i3 >>/tmp/polybar.log 2>&1 & disown;
  fi
fi
if [[ $primary ]]; then
  echo $primary
  MONITOR=$primary polybar main-i3 >>/tmp/polybar.log 2>&1 & disown;
fi
if [[ $secondary ]]; then
  echo $secondary
  for monitor in $(echo "$query" | grep -P '^(?!e).* connected (?!primary)' | cut -d' ' -f1); do
    MONITOR=$monitor polybar secondary-i3 >>/tmp/polybar.log 2>&1 & disown;
  done
fi
echo "--- RESTARTED $primary $secondary $laptop ---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
exit 0


