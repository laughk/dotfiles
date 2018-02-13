#!/usr/bin/env sh
# from https://github.com/jaagr/polybar/wiki

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down

while pgrep -u $UID -x polybar >/dev/null; do
  export MONITOR=$(xrandr| grep primary | awk '{print $1}')
  sleep 1
done

# Launch bar1 and bar2
polybar main_bar &


echo "Bars launched..."
