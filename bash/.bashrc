#
# ~/.bashrc: executed by interactive shells
#

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


#-----------------------.
# ENVIRONMENT VARIABLES |
#-----------------------'
# Skip BROWSER since it interferes with xdg-open
export PATH=$PATH:~/.local/bin
export EDITOR=vim
export VISUAL=vim
export PAGER=less
export XZ_OPT="--threads=0" # multithreaded xz
export WINEDLLOVERRIDES="winemenubuilder.exe=d" # no wine file assoc.


#----------.
# THE LOOK |
#----------'
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Custom bash prompt via kirsle.net/wizards/ps1.html
# root user
if [[ $USER = root ]]; then
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\]\u@\h \[$(tput sgr0)\]\[$(tput setaf 1)\][\w]\n# \[$(tput sgr0)\]";

# ssh session
elif [[ $SSH_TTY ]]; then
#   export PS1="\u@\H [\w]\n\$ "
    export PS1="\[$(tput setaf 2)\]\u@\h \[$(tput setaf 15)\][\w]\n\$ \[$(tput sgr0)\]";

# local session, low-color
elif [[ $(tput colors) -eq 8 ]]; then
    export PS1="\[$(tput bold)\]\[$(tput setaf 3)\]\u \[$(tput setaf 7)\][\w]\n\$ \[$(tput sgr0)\]";

# local session, high-color
elif [[ $(tput colors) -gt 8 ]]; then
    export PS1="\[$(tput setaf 6)\]\u \[$(tput setaf 15)\][\w]\n\$ \[$(tput sgr0)\]";
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
