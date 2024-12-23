#!/usr/bin/env bash

#	The function of this script is only to detect if your Bluetooth interface is present
#	and active and display the information in POLYBAR.
#
#	gh0stzk - https://github.com/gh0stzk/dotfiles
#	07.08.2024 11:55:34

if [ ! -d /sys/class/bluetooth ]; then
	echo # No Bluetooth interface
	exit 0
fi

# Check if Bluetooth interface exists and its status
check_bluetooth() {
	if systemctl is-active --quiet bluetooth.service; then
		if bluetoothctl show | grep -q "Powered: yes"; then
			echo "%{F$POWER_ON}󰂯%{F-}" # Bluetooth is on
		else
			echo "%{F$POWER_OFF}󰂲%{F-}" # Bluetooth is off
		fi
	else
		echo
	fi
}

check_bluetooth
