#!/bin/bash

source "colors.sh"

PERCENTAGE=$(df -H /System/Volumes/Data | awk 'END {print $5}' | sed 's/%//')

case ${PERCENTAGE} in
  9[8-9] | 100)
    ICON="󰪥" COLOR=$RED
    ;;
  8[8-9] | 9[0-7])
    ICON="󰪤" COLOR=$ORANGE
    ;;
  7[6-9] | 8[0-7])
    ICON="󰪣" COLOR=$YELLOW
    ;;
  6[4-9] | 7[0-5])
    ICON="󰪢" COLOR=$YELLOW
    ;;
  5[2-9] | 6[0-3])
    ICON="󰪡" COLOR=$GREEN
    ;;
  4[0-9] | 5[0-1])
    ICON="󰪠" COLOR=$GREEN
    ;;
  2[8-9] | 3[0-9])
    ICON="󰪟" COLOR=$GREEN
    ;;
  1[6-9] | 2[0-7])
    ICON="󰪞" COLOR=$GREEN
    ;;
  [0-9] | 1[0-5])
    ICON="󰝦" COLOR=$GREEN
    ;;
  *)
    # Handle other cases if needed
    ICON="󰅚"
    ;;
esac

sketchybar --animate exp 10 --set $NAME icon=$ICON label="$PERCENTAGE%" icon.color="$COLOR"