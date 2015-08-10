#!/bin/bash
if [ -d /media/smb-rt-n66u-NetworkDrive ]; then
    df -h | grep "NetworkDrive" | awk '{print "NAS "$4,"["$5"]"}'
else
    echo "NAS --"
fi
