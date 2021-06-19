killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get monitors
primary=$(xrandr --query | grep -P ' connected primary' | cut -d' ' -f1)
secondary=$(xrandr --query | grep -P '^(?!e).* connected (?!primary)' | cut -d' ' -f1)

# Launch bars
if [[ -v primary ]]; then
  MONITOR=$primary polybar main-i3 >>/tmp/polybar.log 2>&1 & disown;
fi
if [[ -v secondary ]]; then
  MONITOR=$secondary polybar secondary-i3 >>/tmp/polybar.log 2>&1 & disown;
fi
exit 0
