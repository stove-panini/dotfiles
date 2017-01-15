#!/bin/bash
#
# ~/.tmux/scripts/tmuxline-cpu.sh: Reports CPU usage and temperature
#

TEMP=$(sensors | grep "Physical id 0" | awk '{ printf "%d", $4 }')
# mpstat must collect multiple samples of cpu usage to generate accurate usage %
# awk subtracts idle% from 100 then rounds decimals
IDLE=$(mpstat 1 4 | awk 'END { printf "%0.f", (100 - $12) }')

if
    ! command -v mpstat >/dev/null; then
        echo "Install sysstat"
elif
    ! command -v sensors >/dev/null; then
        echo "Install lm_sensors"
else
    # pad idle% to prevent wiggle
    printf "CPU %2s%% / ${TEMP}°C" "${IDLE}"
fi
