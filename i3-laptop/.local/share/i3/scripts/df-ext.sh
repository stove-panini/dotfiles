#!/bin/bash
#
# Display usage stats for external drives mounted w/ udevil

# First, it tests if the directory is present but empty
# (leftover when unmounted on shutdown rather than by udevil)

if [ ! -f /media/External/* ]; then
    echo "EXT --" && exit 64
elif [ -d /media/External ]; then
    df -h | grep "External" | awk '{print "EXT "$4,"["$5"]"}'
else
    echo "EXT --" && exit 64
fi
