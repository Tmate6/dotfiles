#!/bin/sh
source "colors.sh"

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
PLUGGED_IN="$(pmset -g batt | grep 'AC Power')"
NOT_CHARGING="$(pmset -g batt | grep 'not charging present: true')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

LIMITED="$(battery status | grep 'maintained')"

if [ "$BUTTON" != "" ]; then
  if [ "$LIMITED" != "" ]; then
    battery maintain stop
  else
    battery maintain 80
  fi
fi

LIMITED="$(battery status | grep 'maintained')"



if [ "$LIMITED" != "" ]; then
  BACKGROUND=0x22FFFFFF
else
  BACKGROUND=0x00000000
fi

case "${PERCENTAGE}" in
  [8-9][0-9]|100) ICON="" COLOR=$GREEN  # 100
  ;;
  [5-7][0-9]) ICON="" COLOR=$YELLOW # 75
  ;;
  [2-4][0-9]) ICON="" COLOR=$ORANGE # 50
  ;;
  [1-2][0-9]) ICON="" COLOR=$RED # 25
  ;;
  *) ICON="" COLOR=$RED             # 0
esac

if [[ "$PLUGGED_IN" != "" ]]; then
  if [[ "$NOT_CHARGING" != "" ]]; then
  ICON=""
  else
  ICON=""
  fi
fi


sketchybar --animate exp 10 --set "$NAME" icon="$ICON" icon.color="$COLOR" label="${PERCENTAGE}%" background.color="$BACKGROUND" 
