#!/bin/bash

source "colors.sh"

SIG_STRENGTH=$(system_profiler SPAirPortDataType | grep "Signal" | awk '{print $4}' | head -n 1)
FINAL_SIG_STRENGTH=$(echo "$SIG_STRENGTH" | awk '{print $1}')

if [[ "$FINAL_SIG_STRENGTH" =~ ^-?[0-5][0-9]$ ]]; then
    COLOR="$GREEN"
elif [[ "$FINAL_SIG_STRENGTH" =~ ^-?[6-7][0-9]$ ]]; then
    COLOR="$YELLOW"
elif [[ "$FINAL_SIG_STRENGTH" =~ ^-?[8-9][0-9]$ ]]; then
    COLOR="$ORANGE"
else
    COLOR="$RED"
fi

if [ -z "$FINAL_SIG_STRENGTH" ]; then
    sketchybar --animate exp 10 --set "$NAME" label="Disconnected" icon.color="$RED" label.color="$RED"
else
    sketchybar --set "$NAME" label="$FINAL_SIG_STRENGTH" icon.color="$COLOR" label.color=0xFFFFFFFF
fi
