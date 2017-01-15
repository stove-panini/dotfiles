#!/bin/bash
#
# ~/.tmux/scripts/tmuxline-net.sh: show network status
#

# Type identification is a little hacky. It looks at the first letter of the
# active device. Per Linux convention, ethernet connections start with "e",
# wireless starts with "w". Other things like bridges can be given an arbitrary
# name, so I try to account for that. A wired device with an arbitrary name that
# starts with "w" will cause unexpected behavior.

DEVICE=$(ip -4 address | grep "state UP" | awk '{ print substr($2, 1, length($2)-1) }')
TYPE=$(ip -4 address | grep "state UP" | awk '{ print substr($2, 1, length($2)-length($2)+1) }')
IP4=$(ip -4 address show ${DEVICE} | grep inet | awk '{ print substr($2, 1, length($2)-3) }')
SSID=$(iw dev ${DEVICE} link | grep SSID | sed "s/SSID://" | sed "s/^[ \t]*//")
SIGNAL=$(awk 'NR==3 { print substr($3, 1, length($3)-1) }' /proc/net/wireless)

bars () {
    if (( ${SIGNAL} <= 25 )); then
        echo "▂___"
    elif (( ${SIGNAL} <= 50 )); then
        echo "▂▄__"
    elif (( ${SIGNAL} <= 75 )); then
        echo "▂▄▆_"
    elif (( ${SIGNAL} <= 100 )); then
        echo "▂▄▆█"
    fi
}

if [[ ${TYPE} != "w" ]]; then
    echo "${DEVICE^^} ${IP4}"
elif [[ $TYPE = "w" ]]; then
    echo -n "${SSID} "
    bars
else
    echo "NET DOWN"
fi
