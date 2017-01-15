#!/bin/bash
#
# ~/.tmux/scripts/bat.sh: Show remaining battery capacity
#
CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)

if [[ -e /sys/class/power_supply/BAT0 ]]; then
    echo -n "BAT ${CAPACITY}%"
fi
