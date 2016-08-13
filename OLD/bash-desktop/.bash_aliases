# cd'n around
alias ..='cd ..'            # go up one directory
alias ...='cd ../..'        # go up two
alias ....='cd ../../..'    # go up three
alias cdd='cd -'            # go back to previous dir

# file mgmt
LS_OPTIONS='-F -h --group-directories-first --color=auto'
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias la='ls $LS_OPTIONS -lA'
alias grep='grep -i --color=auto'
alias md='mkdir -p'         # create parent directories if needed
alias rd='rmdir'
alias cp='cp -ir'           # copy dir contents / warn if overwriting
alias mv='mv -i'            # warn if overwriting

# make it easy
alias q='exit'

# udevil stuff
alias m-diskstation="udevil mount diskstation:/volume1/share && [ -n $(pgrep -f pystatus.py) ] && pkill -SIGUSR1 -f 'python /home/stove/.config/i3/pystatus.py'"
alias u-diskstation="udevil umount diskstation:/volume1/share && [ -n $(pgrep -f pystatus.py) ] && pkill -SIGUSR1 -f 'python /home/stove/.config/i3/pystatus.py'"

alias m-external="udevil mount /dev/disk/by-label/External && [ -n $(pgrep -f pystatus.py) ] && pkill -SIGUSR1 -f 'python /home/stove/.config/i3/pystatus.py'"
alias u-external="udevil umount /dev/disk/by-label/External && [ -n $(pgrep -f pystatus.py) ] && pkill -SIGUSR1 -f 'python /home/stove/.config/i3/pystatus.py'"

alias m-private='sudo cryptsetup luksOpen /dev/disk/by-partuuid/0ccc195d-be88-4c40-aa78-358b1af8ecbe c1 && udevil mount /dev/mapper/c1'
alias u-private='udevil umount /dev/mapper/c1 && sudo cryptsetup luksClose c1'

# ssh
alias s-router='ssh admin@edgerouter-x'
alias s-diskstation='ssh root@diskstation'
alias s-nas='ssh root@diskstation'

# disconnect PS3 Dualshock
alias dualshock-off="echo -e 'disconnect 00:23:06:17:FF:26\nquit' | bluetoothctl"
