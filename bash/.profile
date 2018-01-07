#
# ~/.profile: executed by login shell
#

#-----------------------.
# ENVIRONMENT VARIABLES |
#-----------------------'
# Skip BROWSER since it interferes with xdg-open
export PATH=~/.local/bin:~/.npm-global/bin:$PATH
export EDITOR=vim
export VISUAL=vim
export PAGER=less
export XZ_OPT="--threads=0" # multithreaded xz
export WINEDLLOVERRIDES="winemenubuilder.exe=d" # no wine file assoc.


# Finally, source ~/.bashrc if it exists AND we have a bash shell.
[[ -n "$BASH" ]] && [[ -f ~/.bashrc ]] && . ~/.bashrc
