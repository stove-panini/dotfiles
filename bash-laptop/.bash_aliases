# let sudo check for root's aliases
alias sudo='sudo '

# ls shortcuts
export LS_OPTIONS='-F -h --color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias la='ls $LS_OPTIONS -lA'

# color grep and make it case-insensitive
alias grep='grep -i --color=auto'

# mkdir will create parent directories if necessary
alias mkdir='mkdir -p'

# udevil stuff
alias m-netdrive='udevil mount //rt-n66u/NetworkDrive/'
alias u-netdrive='udevil umount //rt-n66u/NetworkDrive/'

alias m-data='udevil mount /dev/sda1'
alias u-data='udevil umount /dev/sda1'

# upgrade packages
alias upgrade='sudo apt-get update && sudo apt-get upgrade'
