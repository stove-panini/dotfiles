#!/bin/bash
#
# ~/.tmux/scripts/tmuxline-cpu.sh: Reports CPU usage and temperature
#

temp=$(sensors | grep "Physical id 0" | awk '{ sub(/\+/, ""); print $4}' | cut -c -2)
idle=$(mpstat | tail -1 | awk '{printf "%0.f", $13}')

if
    ! command -v mpstat >/dev/null; then
        echo "Install sysstat"
elif
    ! command -v sensors >/dev/null; then
        echo "Install lm_sensors"
else
    echo -n "CPU "
    printf "%2s" "$(( 100 - $idle ))"
    echo "% | $temp°C"
fi
