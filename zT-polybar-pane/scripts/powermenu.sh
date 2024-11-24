
options=(
    "󰍁"
    ""
    "󰜉"
    "󰐥"
)

rofi_cmd() {
	rofi -dmenu -theme "$HOME"/.config/polybar/zT-polybar-pane/scripts/rofi/PowerMenu.rasi
}
chosen=$(printf "%s\n" "${options[@]}" | rofi_cmd)

case $chosen in
    "󰐥")
        systemctl poweroff
        ;;
    "󰜉")
        #systemctl reboot
        xfce4-session-logout --reboot
        ;;
    "󰍁")
        #ScreenLocker
        xfce4-session-logout --logout
        ;;
    "")
        #mpc -q pause
        #amixer set Master mute
        #systemctl suspend
        xfce4-session-logout
        ;;
esac
