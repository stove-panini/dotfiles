#!/bin/bash
#
# ~/.tmux/scripts/tmuxline-mem.sh: Displays free physical memory
#

FREE=$(free -h | awk 'NR==2 { print $4 }')
PERCENT=$(free | awk 'NR==2 { printf "%.0f", ($3 / $2) * 100 }')

echo "MEM ${FREE} / ${PERCENT}%"
