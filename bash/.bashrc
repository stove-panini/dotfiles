#
# ~/.bashrc: executed by interactive shells
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
[[ -f /etc/bashrc ]] && source /etc/bashrc

# For the love of god, no Ctrl+S, Ctrl+Q
stty -ixon

# Fuzzy finder keyboard shortcuts
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

# Aliases & functions
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
