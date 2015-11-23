#
# ~/.bash_profile: executed by the login shell
# 

# Environment variables for my session
# See .bashrc for BROWSER variable
export PATH=$PATH:~/.bin
export EDITOR=vim
export VISUAL=vim
export PAGER=less
export TERMINAL="urxvtc -e"

# Initial read of my bashrc goodies
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start X if logging in on TTY1
# For startx config, please move on to .xinitrc...
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
