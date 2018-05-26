#
# ~/.bash_profile: executed by bash login shell
#

#---------.
# OPTIONS |
#---------'
# Additional shell options
shopt -s autocd     # dirs are executed as if cd was called
shopt -s cmdhist    # saves multi-line commands in one history entry
shopt -s globstar   # '**' matches all files, '**/' matches all directories


#-----------------------.
# ENVIRONMENT VARIABLES |
#-----------------------'
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"
export XZ_OPT="--threads=0" # multithreaded xz
export WINEDLLOVERRIDES="winemenubuilder.exe=d" # no wine file assoc.
export PATH="${PATH}:~/.local/bin"

# add gems to our path
if [[ -x /usr/bin/ruby && -x /usr/bin/gem ]]; then
    PATH="${PATH}:$(ruby -e 'print Gem.user_dir')/bin"
fi


# Finally, source ~/.bashrc if it exists AND we have a bash shell.
[[ ${BASH} && -f ~/.bashrc ]] && . ~/.bashrc
