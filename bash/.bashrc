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
export XZ_OPT="--threads=0"     # multithreaded xz


#----------.
# THE LOOK |
#----------'
# Custom bash prompt via kirsle.net/wizards/ps1.html
# High-color prompt tuned for Solarized dark
# Low-color TTY
if [[ $(tput colors) -eq 8 ]]; then
        export PS1="\[$(tput bold)\]\[$(tput setaf 3)\]\u \[$(tput setaf 7)\][\w]\n\$ \[$(tput sgr0)\]";
# High-color TTY
elif [[ $(tput colors) -gt 8 ]]; then
        export PS1="\[$(tput setaf 4)\]\u \[$(tput setaf 15)\][\w]\n\[$(tput setaf 15)\]\$ \[$(tput sgr0)\]";
fi

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi


#---------.
# ALIASES |
#---------'
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
