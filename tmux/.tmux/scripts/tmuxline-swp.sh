#!/bin/bash
#
# ~/.tmux/scripts/tmuxline-swap.sh: Displays swap usage
#

# TODO: become an awk wizard

free=$(free -h | grep "Swap" | awk '{print $4}')
percent=$(free -h | grep "Swap" | awk '{printf "(%.0f%)\n", $3 / $2 * 100}')

echo "SWP $free $percent"
