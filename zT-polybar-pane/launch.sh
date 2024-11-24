#!/usr/bin/env bash

dir="$HOME/.config/polybar/zT-polybar-pane/"

launch_bar() {

	# Terminate already running bar instances
	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	# Wait pulseaudio launch or bar freezes
	sleep 0.5

	# Launch the bar
	polybar -q main -c "$dir/config.ini" &
	polybar -q tray -c "$dir/config.ini" &

	# xdo show/hide workaround for FS on top
	#sleep 0.2
	#xdo hide -n polybar
	#xdo show -n polybar
}

launch_bar
