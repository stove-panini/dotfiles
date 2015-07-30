# let sudo check for root's aliases
alias sudo='sudo '

# ls shortcuts
alias ls='ls -F --color=auto'
alias ll='ls -l'
alias la='ls -lA'

# color grep and make it case-insensitive
alias grep='grep -i --color=auto'

# mkdir will create parent directories if necessary
alias mkdir='mkdir -p'

# udevil stuff
alias m-netdrive='udevil mount //rt-n66u/NetworkDrive/'
alias u-netdrive='udevil umount //rt-n66u/NetworkDrive/'

alias m-external='udevil mount /dev/disk/by-label/External'
alias u-external='udevil umount /dev/disk/by-label/External'

# disconnect PS3 Dualshock
alias dualshock-off="echo -e 'disconnect 00:23:06:17:FF:26\nquit' | bluetoothctl"

# tell pacaur to use the new AUR4
alias pacaur='pacaur --domain aur4.archlinux.org'
