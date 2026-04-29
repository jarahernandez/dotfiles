#!/bin/bash

#   󰒲 󰋊 󰌾 

# Define the options with icons (requires a Nerd Font)
options="  Shutdown\n  Reboot\n  Suspend\n󰋊  Hibernate\n󰍃  Logout\n󰌾  Lock screen"

# Use rofi in dmenu mode to show the list and capture the selection
chosen=$(echo -e "$options" | rofi -dmenu -i -theme ~/.config/rofi/power-menu.rasi)

# Execute the command based on the choice
case $chosen in
    *Shutdown) systemctl poweroff ;;
    *Reboot) systemctl reboot ;;
    *Suspend) systemctl suspend ;;
    *Hibernate) systemctl hibernate ;;
    *Logout) hyprctl dispatch exit ;;
    *"Lock screen") hyprlock ;;
esac
