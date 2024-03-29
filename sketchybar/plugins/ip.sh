#!/bin/bash

IP=$(curl ifconfig.me)
MAX_LENGTH=15

if [ "$BUTTON" != "" ]; then
    echo "$IP" | pbcopy
fi

if [ ${#IP} -gt $MAX_LENGTH ]; then
    IP=""
fi

if [ "$IP" = "" ]; then
    sketchybar --animate exp 10 --set $NAME label.drawing=false icon.drawing=false
else
    sketchybar --animate exp 10 --set $NAME label.drawing=true icon.drawing=true label="$IP"
fi