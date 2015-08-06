#!/bin/bash
if [ -d /media/External ]; then
    df -h | grep "External" | awk '{print "EXT "$4,"["$5"]"}'
else
    echo "EXT --"
fi
