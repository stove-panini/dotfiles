#
#
# ~/.bashrc: executed by interactive shells
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#----------.
# THE LOOK |
#----------'

# The TTY can only display 0-7. The bold flag is needed to access 8-15.
# 0/8  - Black
# 1/9  - Red
# 2/10 - Green
# 3/11 - Yellow
# 4/12 - Blue
# 5/13 - Magenta
# 6/14 - Cyan
# 7/15 - White

if [[ ${USER} = root ]]; then
    COL1=9
    COL2=1
    COL3=1
    LOCOL1=1
    LOCOL2=1

elif [[ ${SSH_TTY} ]]; then
    COL1=10
    COL2=2
    COL3=15
    LOCOL1=2
    LOCOL2=7

else
    COL1=12
    COL2=4
    COL3=15
    LOCOL1=4
    LOCOL2=7
fi

# Custom bash prompt via kirsle.net/wizards/ps1.html
# local session, high-color
if [[ $(tput colors) -gt 8 ]]; then
    export PS1="\[$(tput setaf ${COL1})\]\u\[$(tput setaf ${COL2})\]@\h \[$(tput setaf ${COL3})\][\w]\n\$ \[$(tput sgr0)\]";

# local session, low-color
elif [[ $(tput colors) -eq 8 ]]; then
    export PS1="\[$(tput bold)\]\[$(tput setaf ${LOCOL1})\]\u@\h \[$(tput setaf ${LOCOL2})\][\w]\n\$ \[$(tput sgr0)\]";
fi

# enable color in ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi


#---------.
# ALIASES |
#---------'
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
