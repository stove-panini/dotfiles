#
# ~/.bash_profile: executed by bash login shell
#

#---------.
# OPTIONS |
#---------'
# Additional shell options
shopt -s cmdhist    # saves multi-line commands in one history entry

#-----------------------.
# ENVIRONMENT VARIABLES |
#-----------------------'
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"
export PATH="${HOME}/.local/bin:${PATH}"

# add MacPorts to our path, if we're on a Mac
if [[ $(uname -s) = 'Darwin' ]]; then
    export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
fi

# add gems to our path
if [[ $(which ruby) && $(which gem) ]]; then
    PATH="${PATH}:$(ruby -e 'print Gem.user_dir')/bin"
    # Bundler uses this!
    export GEM_HOME=$(ruby -e 'print Gem.user_dir')
fi

# Finally, source ~/.bashrc if it exists AND we have a bash shell.
[[ ${BASH} && -f ~/.bashrc ]] && . ~/.bashrc
