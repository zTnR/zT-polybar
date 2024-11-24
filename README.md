
![0](https://github.com/zTnR/zT-polybar/blob/main/preview/zT-polybar-thumb.png)

2 versions :

> zT-polybar-pane : the greyed background one.

> zT-polybar-dock : docked on top, whole screen width, transparent by default (not the menus), meant for dark background.

# Installation

Copy the 2 fonts in ```~/.local/share/fonts```

Copy ```zT-polybar-dock``` or ```zT-polybar-pane``` folder in ```~/.config/polybar```

Launch with ```/launch.sh```

Install ```Rofi``` for the menus.

# Mouse buttons

```
- Power Menu         > Left click      : Open menu
- Power Menu         > Right click     : Instant reboot

- Network            > Left click      : Open menu
- Network            > Right click     : Network connections window

- Bluetooth          > Left click      : Open menu
- Bluetooth          > Right click     : Bluetooth devices window

- Updates            > Left click      : Open terminal

- Volume             > Left click      : Mute
- Volume             > Right click     : Pulseaudio window

- Windows            > Left click      : Show / hide window
- Windows            > Right click     : close window
```

# Misc

### App launchers

In ```/user_modules.ini```

```
[module/links]

...

[module/thunar]
inherit = module/links
content = [Icon]
click-left = exo-open --launch FileManager
```

### Network / Bluetooth

Uses ```nm-applet``` and ```blueman``` by default

In ```/user_modules.ini```

```
[module/nm-launcher]

type=custom/text
content = [Icon]
click-left = ~/.config/polybar/zT-polybar-dock/scripts/NetManagerDM
click-right = nm-connection-editor

[module/bluetooth]

type=custom/text
content = [Icon]
click-left = ~/.config/polybar/zT-polybar-dock/scripts/rofi-bluetooth
click-right = blueman-manager
```

### Power menu

Uses some Xfce4 commands, modify in ```/scripts/powermenu.sh```

```
case $chosen in
    "󰐥")
        systemctl poweroff
        ;;
    "󰜉")
        xfce4-session-logout --reboot
        ;;
    "󰍁")
        xfce4-session-logout --logout
        ;;
    "")
        xfce4-session-logout
        ;;
esac
```

### Fonts and Colors

Bar fonts : ```/config.ini```

```
[bar/main]

...

font-0 = "Fantasque Sans Mono:pixelsize=12;4"
font-1 = "Iosevka Nerd Font:pixelsize=12;4"
```

Bar colors : ```/colors.ini```

```
[color]

#background = #1F1F1F
background = #001F1F1F #Transparent background
foreground = #2f9b85
foreground-alt = #808080
```

Menus : ```/scripts/rofi/shared.rasi```

```
* {
    font: "Fantasque Sans Mono 9";
    background: #1F1F1F;
    foreground: #808080;
    selected: #2f9b85;
}
```

### Bottom bar

Disabled by default. Contains Title, Telemetry and system tray.

Can be enabled in ```/launch.sh``` by uncommenting

```
polybar -q tray -c "$dir/config.ini" &
```

### Fullscreen workaround

Xdo cleanest dirty workaround I could come up with to avoid the bar staying on top of fullscreen. Works when it wants to. Commented by default. Sleep must be long enough for the bar to fully initialize beforehand.

In ```/launch.sh```

```
	# xdo show/hide workaround for FS on top
	#sleep 0.2
	#xdo hide -n polybar
	#xdo show -n polybar
```

# Credits

Network / Bluetooth menus : [gh0stzk dotfiles](https://github.com/gh0stzk/dotfiles)

Windows : [polywins](https://github.com/jiriklepl/light-polybar-windows)
