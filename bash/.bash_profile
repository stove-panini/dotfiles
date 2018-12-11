#
# ~/.bash_profile: executed by bash login shell
#

#---------.
# OPTIONS |
#---------'
# Additional shell options
#shopt -s autocd     # dirs are executed as if cd was called
shopt -s cmdhist    # saves multi-line commands in one history entry
#shopt -s globstar   # '**' matches all files, '**/' matches all directories


#-----------------------.
# ENVIRONMENT VARIABLES |
#-----------------------'
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"
export PATH="${HOME}/.local/bin:${PATH}"

# disable wine file assoc.
if [[ -x /usr/bin/wine ]]; then
    export WINEDLLOVERRIDES="winemenubuilder.exe=d"
fi

# add gems to our path
if [[ -x /usr/bin/ruby && -x /usr/bin/gem ]]; then
    PATH="${PATH}:$(ruby -e 'print Gem.user_dir')/bin"
    # Bundler uses this!
    export GEM_HOME=$(ruby -e 'print Gem.user_dir')
fi


# Finally, source ~/.bashrc if it exists AND we have a bash shell.
[[ ${BASH} && -f ~/.bashrc ]] && . ~/.bashrc
