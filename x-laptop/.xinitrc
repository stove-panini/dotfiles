#!/bin/sh
#
# ~/.xinitrc: executed by xinit or startx
#

# Merge in startup propgrams, resources, and keymap
sysautostart=/etc/xprofile
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
userautostart=$HOME/.xprofile
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

[ -f "$sysautostart" ] && source "$sysautostart"
[ -f "$sysresources" ] && xrdb -merge "$sysresources"
[ -f "$sysmodmap" ] && xmodmap "$sysmodmap"

[ -f "$userautostart" ] && source "$userautostart"
[ -f "$userresources" ] && xrdb -merge "$userresources"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"


# Start programs placed in global xinitrc.d directory
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Finally, start the window manager
exec /usr/bin/i3
