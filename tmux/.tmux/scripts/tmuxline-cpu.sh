#!/bin/bash
#
# ~/.tmux/scripts/tmuxline-cpu.sh: Reports CPU usage as a percentage
#

# TODO: pray to god that the highest thermal_zoneN dir is reserved for cpu avg
#       temp across all machines everywhere ever (ha ha ha)

zone=$(ls -1 /sys/class/thermal/ | grep "thermal_zone" | tail -1)
idle=$(mpstat | tail -n1 | awk '{printf "%0.f", $13}')
temp=$(cat /sys/class/thermal/$zone/temp | cut -c 1-2)

if
    ! command -v mpstat >/dev/null; then
        echo "Install sysstat package!"
else
    echo -n "CPU "
    printf "%2s" "$(( 100 - $idle ))"
    echo "% | $temp°C"
fi
