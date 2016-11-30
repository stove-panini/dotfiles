#!/bin/bash
#
# ~/.tmux/scripts/tmuxline-cpu.sh: Reports CPU usage and temperature
#

temp=$(sensors | grep "Physical id 0" | awk '{ sub(/\+/, ""); print $4 }' | cut -c -2)
# mpstat must collect multiple samples of cpu usage to generate accurate usage %
# awk subtracts idle% from 100 then rounds decimals
idle=$(mpstat 1 4 | tail -1 | awk '{ printf "%0.f", (100 - $12) }')

if
    ! command -v mpstat >/dev/null; then
        echo "Install sysstat"
elif
    ! command -v sensors >/dev/null; then
        echo "Install lm_sensors"
else
    echo -n "CPU "
    # pad output to 2 spaces to prevent statusbar wiggle
    printf "%2s" "$idle"
    echo "% / $temp°C"
fi
