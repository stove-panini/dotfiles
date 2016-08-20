#!/bin/bash
#
# ~/.tmux/scripts/tmuxline-cpu.sh: Reports CPU usage as a percentage
#

# TODO: 1. use awk for floating point operations instead of dropping decimals with sed
#       2. magically determine the right thermal_zone ugh


idle=$(mpstat | tail -n1 | awk '{print $13}' | sed s/\...$//)
temp=$(cat /sys/class/thermal/thermal_zone2/temp | cut -c 1-2)

if
    ! command -v mpstat >/dev/null; then
        echo "Install sysstat package!"
else
    echo "CPU $(( 100 - $idle ))% | $temp°C"
fi