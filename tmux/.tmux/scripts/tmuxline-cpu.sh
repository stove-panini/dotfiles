#!/bin/bash
#
# ~/.tmux/scripts/tmuxline-cpu.sh: Reports CPU usage as a percentage
#

# TODO: magically determine the right thermal_zone ugh

idle=$(mpstat | tail -n1 | awk '{printf "%0.f", $13}')
temp=$(cat /sys/class/thermal/thermal_zone2/temp | cut -c 1-2)

if
    ! command -v mpstat >/dev/null; then
        echo "Install sysstat package!"
else
    echo -n "CPU "
    printf "%2s" "$(( 100 - $idle ))"
    echo "% | $temp°C"
fi
