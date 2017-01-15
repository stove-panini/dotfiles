#!/bin/bash
#
# ~/.tmux/scripts/tmuxline-disk.sh: Shows free space of the root volume
#

df -h | grep /$ | awk '{ print "DSK " $4 " / " $5 }'
