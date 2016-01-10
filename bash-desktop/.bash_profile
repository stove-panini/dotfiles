#
# ~/.bash_profile: executed by the login shell
# 

# Environment variables for my session
# Skip BROWSER since it interferes with xdg-open
export PATH=$PATH:~/.bin
export EDITOR=vim
export VISUAL=vim
export PAGER=less
export TERMINAL="termite -e"    # how xdg-open determines your terminal emulator
export XZ_OPT="--threads=0"     # multithreaded xz

# Beets bash completion
eval "$(beet completion)"

# Initial read of my bashrc goodies
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start X if logging in on TTY1
# For startx config, please move on to .xinitrc...
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx    # USING XDM FOR NOW...
