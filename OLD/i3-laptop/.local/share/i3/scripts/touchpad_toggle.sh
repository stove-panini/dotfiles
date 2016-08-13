#!/bin/bash
if synclient -l | grep "TouchpadOff .*=.*0" ; then
    synclient TouchpadOff=1 && xinput disable "SynPS/2 Synaptics TouchPad";
else
    synclient TouchpadOff=0 && xinput enable "SynPS/2 Synaptics TouchPad";
fi
