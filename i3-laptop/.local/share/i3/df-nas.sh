#!/bin/bash
#
# Display usage stats for external drives mounted w/ udevil

# First, it tests if the directory is present but empty
# (leftover when unmounted on shutdown rather than by udevil)

if [ ! -f /media/smb-diskstation-share/* ]; then
    echo "NAS --"
elif [ -d /media/smb-diskstation-share ]; then
    df -h | grep "diskstation" | awk '{print "NAS "$4,"["$5"]"}'
else
    echo "NAS --"
fi
