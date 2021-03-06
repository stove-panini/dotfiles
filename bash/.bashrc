#
# ~/.bashrc: executed by interactive shells
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
[[ -f /etc/bashrc ]] && source /etc/bashrc

# Fuzzy finder keyboard shortcuts (line added by install hook)
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Aliases & functions
[[ -f "${HOME}/.bash_aliases" ]] && source "${HOME}/.bash_aliases"

# For the love of god, no Ctrl+S, Ctrl+Q
stty -ixon

# Make dircolors match colorscheme
if [[ -x "$(command -v dircolors)" ]]; then
    if [[ -r "${HOME}/.dircolors" ]]; then
        eval "$(dircolors -b "${HOME}/.dircolors")"
    else
        eval "$(dircolors -b)"
    fi
fi

# Set prompt
# 0/8  - Black     4/12 - Blue
# 1/9  - Red       5/13 - Magenta
# 2/10 - Green     6/14 - Cyan
# 3/11 - Yellow    7/15 - White

if [[ "${USER}" = root ]]; then
    color1=9
    color2=1
    color3=1
elif [[ -n "${TOOLBOX_PATH}" ]]; then
    color1=14
    color2=6
    color3=7
else
    color1=12
    color2=4
    color3=7
fi

PS1="\[$(tput setaf ${color1})\]\u\[$(tput setaf ${color2})\]@\h \[$(tput setaf ${color3})\][\w]\n\$ \[$(tput sgr0)\]"
export PS1
