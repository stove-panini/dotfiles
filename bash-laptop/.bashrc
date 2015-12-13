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
if [[ -n $SSH_CLIENT ]] || [[ -n $SSH_TTY ]]; then
    # SSH client prompt shows hostname
    export PS1="\[$(tput setaf 6)\]\u\[$(tput setaf 4)\]@\h \[$(tput setaf 15)\][\w]\n\\$ \[$(tput sgr0)\]"; else
    # Local prompt does not
    export PS1="\[$(tput setaf 3)\]\u \[$(tput setaf 15)\][\w]\n\[$(tput setaf 15)\]\$ \[$(tput sgr0)\]"
fi

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Base16 Shell colorscheme
BASE16_SHELL="$HOME/.config/base16-shell/base16-tomorrow.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL


#------.
# FUCK |
#------'
# Gotta set this environment variable here bc .bash_profile only sources it once, BEFORE X starts
export BROWSER="$(if [[ -n $DISPLAY ]]; then echo 'chromium'; else echo 'w3m'; fi)"


#-------------.
# THE ALIASES |
#-------------'
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
