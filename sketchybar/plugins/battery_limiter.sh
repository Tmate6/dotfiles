#!/bin/sh

LIMITED="$(battery status | grep 'maintained')"

ICON="􁁔"

if [ "$BUTTON" != "" ]; then
  if [ "$LIMITED" != "" ]; then
    battery maintain stop
  else
    battery maintain 80
  fi
fi

LIMITED="$(battery status | grep 'maintained')"

if [ "$LIMITED" != "" ]; then
  ICON="􁁕"
fi

sketchybar --set "$NAME" icon="$ICON"