#!/bin/bash
#
# ~/.tmux/scripts/tmuxline-nm.sh: show network status with network manager
#

# TODO: 1. Support multiple connected interfaces

DEVICE=$(nmcli -t dev show | grep -B4 -A8 "(connected)" | grep "GENERAL.DEVICE" | cut -d ":" -f 2)
TYPE=$(nmcli -t dev show | grep -B4 -A8 "(connected)" | grep "GENERAL.TYPE" | cut -d ":" -f 2)
IP4=$(nmcli -t dev show | grep -B4 -A8 "(connected)" | grep "IP4.ADDRESS" | cut -d ":" -f 2 | sed s=/.*$==)
W_SSID=$(nmcli -t --fields IN-USE,SSID dev wifi | grep "\*" | cut -d ":" -f 2)
W_BARS=$(nmcli -t --fields IN-USE,BARS dev wifi | grep "\*" | cut -d ":" -f 2)


if [[ $TYPE = ethernet ]]; then
    # Ethernet output: ENO1 192.168.1.123
    echo "${DEVICE^^} $IP4"
elif [[ $TYPE = wifi ]]; then
    # Wifi output: WLP3S0 HOME_NETWORK (84%)
    echo "${DEVICE^^} $W_SSID $W_BARS"
else
    echo "NET DOWN"
fi
