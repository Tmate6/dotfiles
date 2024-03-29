#!/bin/bash

MEM_INFO=$(ps -eo pmem,user)
MEM_TOTAL=$(echo "$MEM_INFO" | sed  "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print 8/sum}")

ECHO $MEM_TOTAL

sketchybar --animate exp 10 --set $NAME label="$MEM_PERCENT%"