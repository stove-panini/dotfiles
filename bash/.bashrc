#
#
# ~/.bashrc: executed by interactive shells
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#---------.
# OPTIONS |
#---------'
# see bash manpage under SHELL BUILTIN COMMANDS
shopt -s autocd
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s globstar
shopt -s nocaseglob

# history
HISTCONTROL=ignoreboth
HISTSIZE=2000
HISTFILESIZE=1000
shopt -s histappend

# bash completion w/ sudo
complete -cf sudo


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
    color1=9
    color2=1
    color3=1
    lowcolor1=1
    lowcolor2=1

elif [[ ${SSH_TTY} ]]; then
    color1=10
    color2=2
    color3=15
    lowcolor1=2
    lowcolor2=7

else
    color1=12
    color2=4
    color3=15
    lowcolor1=6
    lowcolor2=7
fi

# Using single quotes because $ is a special character!
# local session, high-color
if [[ $(tput colors) -gt 8 ]]; then
    export PS1='\[$(tput setaf ${color1})\]\u\[$(tput setaf ${color2})\]@\h \[$(tput setaf ${color3})\][\w]\n\$ \[$(tput sgr0)\]';

# local session, low-color
elif [[ $(tput colors) -eq 8 ]]; then
    export PS1='\[$(tput bold)\]\[$(tput setaf ${lowcolor1})\]\u@\h \[$(tput setaf ${lowcolor2})\][\w]\n\$ \[$(tput sgr0)\]';
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
