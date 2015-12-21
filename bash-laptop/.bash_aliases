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
alias m-diskstation='udevil mount diskstation:/volume1/share'
alias u-diskstation='udevil umount diskstation:/volume1/share'

alias m-data='udevil mount /dev/sda1'
alias u-data='udevil umount /dev/sda1'

# ssh
alias s-router='ssh admin@edgerouter-x'
alias s-diskstation='ssh root@diskstation'
alias s-ossuary='ssh -Y stove@ossuary'

# wol desktop
alias wol-ossuary='wol 44:8a:5b:9c:1d:fa'
