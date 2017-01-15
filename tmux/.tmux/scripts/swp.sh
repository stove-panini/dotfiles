#!/bin/bash
#
# ~/.tmux/scripts/tmuxline-swap.sh: Displays swap usage
#

FREE=$(free -h | awk 'NR==3 { print $4 }')
PERCENT=$(free | awk 'NR==3 {printf "%.0f", ($3 / $2) * 100 }')

echo "SWP ${FREE} / ${PERCENT}%"
