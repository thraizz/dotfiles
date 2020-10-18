killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get monitors
primary=$(xrandr --query | grep -P ' connected primary' | cut -d' ' -f1)
secondary=$(xrandr --query | grep -P ' connected (?!primary)' | cut -d' ' -f1)

# Launch bars
echo "--- RESTARTED ---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
if [[ $DESKTOP_SESSION == "openbox" ]]; then
    MONITOR=$primary polybar main-ewmh >>/tmp/polybar.log 2>&1 & disown;
    MONITOR=$secondary polybar secondary-ewmh >>/tmp/polybar.log 2>&1 & disown;
    exit 0
else
    MONITOR=$primary polybar main-i3 >>/tmp/polybar.log 2>&1 & disown;
    MONITOR=$secondary polybar secondary-i3 >>/tmp/polybar.log 2>&1 & disown;
    exit 0
fi
MONITOR=$(xrandr --query | grep primary | grep -Eo '^e[^ ]+') polybar laptop >>/tmp/polybar.log 2>&1 & disown;
