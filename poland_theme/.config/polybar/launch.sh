#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar system_bar 2>&1 | tee -a /tmp/polybar.log & disown
echo "${date}: system_bar launched"
polybar activity_bar 2>&1 | tee -& /tmp/polybar.log & disown
echo "${date}: activity_bar launched"
polybar media_bar 2>&1 | tee -& /tmp/polybar.log & disown
echo "${date}: media_bar launched"

