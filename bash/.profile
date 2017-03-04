#
# ~/.profile: executed by login shell
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


# Finally, source ~/.bashrc if it exists AND we have a bash shell.
[[ -n "$BASH" ]] && [[ -f ~/.bashrc ]] && . ~/.bashrc
