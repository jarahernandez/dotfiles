#!/bin/bash

selection=$(cliphist list | rofi -dmenu -i -name "rofi" -display-columns 2 -theme ~/.config/rofi/clipboard.rasi)

if [ -n "$selection" ]; then
    echo "$selection" | cliphist decode | wl-copy
fi