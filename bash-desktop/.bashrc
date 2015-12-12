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

# vi mode at the prompt
set -o vi


#----------.
# THE LOOK |
#----------'
# Custom bash prompt via kirsle.net/wizards/ps1.html
export PS1="\[$(tput setaf 3)\]\u\[$(tput setaf 16)\]@\h \[$(tput setaf 7)\][\w]\n\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Base16 Shell colorscheme
BASE16_SHELL="$HOME/.config/base16-shell/base16-tomorrow.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL


#-------------.
# THE ALIASES |
#-------------'
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
