#!/bin/bash
#
# ~/.tmux/scripts/tmuxline-nm.sh: show network status with network manager
#

# TODO: 1. Support multiple connected interfaces

DEVICE=$(nmcli dev status | grep " connected " | awk '{print $1}' | head -n 1)
TYPE=$(nmcli dev status | grep " connected " | awk '{print $2}')
IP4=$(nmcli -t dev show | grep "IP4.ADDRESS" | grep -v "127.0.0.1" | cut -d ":" -f 2 | sed s=/.*$==)
W_SSID=$(nmcli -t --fields IN-USE,SSID dev wifi | grep "\*" | cut -d ":" -f 2)
W_BARS=$(nmcli -t --fields IN-USE,BARS dev wifi | grep "\*" | cut -d ":" -f 2)


if [[ $TYPE = "ethernet" || $TYPE = "bridge" ]]; then
    # Ethernet output: ENO1 192.168.1.123
    echo "${DEVICE^^} $IP4"
elif [[ $TYPE = "wifi" ]]; then
    # Wifi output: HOME_NETWORK ▂▄▆_
    echo "$W_SSID $W_BARS ($IP4)"
else
    echo "NET DOWN"
fi
