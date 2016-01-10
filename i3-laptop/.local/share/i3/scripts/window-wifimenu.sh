#!/bin/bash
if [[ $TERM == rxvt-unicode* ]]; then
    i3-msg exec "urxvt -name 'wifi-menu' -e 'sudo wifi-menu -o'"

elif [[ $TERM == xterm-termite ]]; then
    i3-msg exec "termite --name=wifi-menu --exec='sudo wifi-menu -o'"
fi
