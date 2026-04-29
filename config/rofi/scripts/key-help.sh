#!/bin/bash
BINDS_FILE="$HOME/.config/hypr/modules/binds.conf"

# 1. Get only lines that start with 'bind'
# 2. Strip 'bind = ' from the start
# 3. Replace '$mainMod' with 'SUPER'
# 4. Replace 'SHIFT' and 'CTRL' if needed (case-sensitive)
# 5. Format the output with arrows for readability
grep 'bind' "$BINDS_FILE" | grep '#' | awk -F'[,#]' '{
    # Clean the first part (e.g., bind = $mainMod SHIFT)
    mod=$1; gsub(/bind[ ]*=[ ]*/, "", mod); gsub(/^[ \t]+|[ \t]+$/, "", mod);
    
    # Clean the second part (the key, e.g., V or Return)
    key=$2; gsub(/^[ \t]+|[ \t]+$/, "", key);
    
    # Clean the description (everything after the #)
    desc=$NF; gsub(/^[ \t]+|[ \t]+$/, "", desc);
    
    # Logic: Only add " + " if mod is NOT empty
    if (mod != "") {
        keys_combined = mod " + " key
    } else {
        keys_combined = key
    }

    # Print formatted
    if (key != "") print keys_combined " ➜ " desc
}' | sed 's/\$mainMod/SUPER/g' | column -t -s '➜' -o '  ➜  ' | \

rofi -dmenu -i -config ~/.config/rofi/key-help.rasi
