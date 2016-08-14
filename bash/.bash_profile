#
# ~/.bash_profile: executed by the login shell
# 

# Environment variables for my session
# Skip BROWSER since it interferes with xdg-open
export PATH=$PATH:~/.bin
export EDITOR=vim
export VISUAL=vim
export PAGER=less
export XZ_OPT="--threads=0"     # multithreaded xz

# Beets bash completion		will reinstall soon
#eval "$(beet completion)"

# Initial read of my bashrc goodies
# GNOME ignores this to prevent an infinite loop (see .bashrc)
if [[ $DESKTOP_SESSION != gnome ]]; then
    [[ -f ~/.bashrc ]] && . ~/.bashrc
fi
