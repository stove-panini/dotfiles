#
# ~/.bashrc: executed by interactive shells
#

#-------------.
# THE OPTIONS |
#-------------'
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

# vi mode at the prompt (nah)
#set -o vi


#----------.
# THE LOOK |
#----------'
# Custom bash prompt via kirsle.net/wizards/ps1.html
# Low-color TTY
if [[ $(tput colors) = 8 ]]; then
        export PS1="\[$(tput bold)\]\[$(tput setaf 3)\]\u \[$(tput setaf 7)\][\w]\n\$ \[$(tput sgr0)\]";
# SSH client prompt shows hostname
elif [[ -n $SSH_CLIENT ]] || [[ -n $SSH_TTY ]]; then
        export PS1="\[$(tput setaf 6)\]\u\[$(tput setaf 4)\]@\h \[$(tput setaf 15)\][\w]\n\\$ \[$(tput sgr0)\]";
# 256-color terminal emulator
else    export PS1="\[$(tput setaf 3)\]\u \[$(tput setaf 15)\][\w]\n\[$(tput setaf 15)\]\$ \[$(tput sgr0)\]";
fi

# enable color support of ls
if [[ -x /usr/bin/dircolors ]]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi


#-------------.
# THE ALIASES |
#-------------'
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi