#!/bin/bash
#
# ~/.tmux/scripts/tmuxline-mem.sh: Displays free physical memory
#

# TODO: become an awk wizard

free=$(free -h | grep "Mem" | awk '{print $4}')
percent=$(free | grep "Mem" | awk '{printf "%.0f%\n", $3 / $2 * 100}')

echo "MEM $free | $percent"
