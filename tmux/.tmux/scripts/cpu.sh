#!/bin/bash
#
# ~/.tmux/scripts/tmuxline-cpu.sh: Reports CPU usage and temperature
#

TEMP=$(sensors | grep "Physical id 0" | awk '{ printf "%d", $4 }')
# mpstat monitors cpu usage over 4 seconds to generate accurate usage%
# awk subtracts idle% & iowait% from 100 then rounds decimals
USE=$(mpstat 4 1 | awk 'END { printf "%2.f", (100 - $6 - $12) }')

if
    ! command -v mpstat >/dev/null; then
        echo "Install sysstat"
elif
    ! command -v sensors >/dev/null; then
        echo "Install lm_sensors"
else
    # pad idle% to prevent wiggle
    echo "CPU ${USE}% / ${TEMP}°C"
fi
