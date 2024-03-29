#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

ICON=􀀀

if [ "$SELECTED" != "false" ]; then
    FONT="Hack Nerd Font Mono:Bold:15.0"
    ICON="􀀁"
fi

sketchybar --set "$NAME" \
    icon.font="$FONT" \
    icon="$ICON"
