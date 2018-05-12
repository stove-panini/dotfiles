#
# ~/.bashrc: executed by interactive shells
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
[[ -f /etc/bashrc ]] && source /etc/bashrc

# Source chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

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
if [[ -x /usr/bin/dircolors ]]; then
    if [[ -r ~/.dircolors ]]; then
        eval "$(dircolors -b ~/.dircolors)"
    else
        eval "$(dircolors -b)"
    fi
fi


#---------.
# ALIASES |
#---------'
# cd'n around
alias ..="cd .."            # go up one directory
alias ...="cd ../.."        # go up two
alias ....="cd ../../.."    # go up three
alias cdd="cd -"            # go back to previous dir

# file mgmt
LS_OPTIONS="-F -h --group-directories-first --color=auto"
alias ls="ls $LS_OPTIONS"
alias ll="ls $LS_OPTIONS -l"
alias la="ls $LS_OPTIONS -lA"
alias grep="grep -i --color=auto"
alias mkdir="mkdir -p"      # create parent directories if needed
alias cp="cp -ir"           # copy dir contents / warn if overwriting
alias mv="mv -i"            # warn if overwriting
alias rsync="rsync -aP"     # archive mode with progress bar

# make it easy
alias q="exit"

# source site-specific aliases file
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
