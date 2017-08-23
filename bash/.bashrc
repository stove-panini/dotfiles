#
#
# ~/.bashrc: executed by interactive shells
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#----------.
# THE LOOK |
#----------'

# A reminder:
# 0 - Black
# 1 - Red
# 2 - Green
# 3 - Yellow
# 4 - Blue
# 5 - Magenta
# 6 - Cyan
# 7 - White

# Custom bash prompt via kirsle.net/wizards/ps1.html
# root user
if [[ $USER = root ]]; then
    export PS1="\[$(tput bold)\]\[$(tput setaf 1)\]\u@\h \[$(tput sgr0)\]\[$(tput setaf 1)\][\w]\n# \[$(tput sgr0)\]";

# ssh session
elif [[ $SSH_TTY ]]; then
    export PS1="\[$(tput setaf 2)\]\u@\h \[$(tput setaf 15)\][\w]\n\$ \[$(tput sgr0)\]";

# local session, low-color
elif [[ $(tput colors) -eq 8 ]]; then
    export PS1="\[$(tput bold)\]\[$(tput setaf 3)\]\u \[$(tput setaf 7)\][\w]\n\$ \[$(tput sgr0)\]";

# local session, high-color
elif [[ $(tput colors) -gt 8 ]]; then
    export PS1="\[$(tput setaf 4)\]\u \[$(tput setaf 15)\][\w]\n\$ \[$(tput sgr0)\]";
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
