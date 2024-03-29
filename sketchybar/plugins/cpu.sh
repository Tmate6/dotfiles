#!/bin/bash
source "colors.sh"

CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)
CPU_INFO=$(ps -eo pcpu,user)
CPU_SYS=$(echo "$CPU_INFO" | grep -v $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")
CPU_USER=$(echo "$CPU_INFO" | grep $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")

CPU_PERCENT="$(echo "$CPU_SYS $CPU_USER" | awk '{printf "%.0f\n", ($1 + $2)*100}')"

case "${CPU_PERCENT}" in
  [8-9][0-9]|100) COLOR=$RED
  ;;
  [5-7][0-9]) COLOR=$ORANGE
  ;;
  [3-4][0-9]) COLOR=$YELLOW
  ;;
  *) COLOR=$GREEN
esac

sketchybar --animate exp 10 --set $NAME label="$CPU_PERCENT%" icon.color="$COLOR"