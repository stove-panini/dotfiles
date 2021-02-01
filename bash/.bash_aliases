#
# ~/.bash_aliases: command aliases and functions
#

[[ -x $(command -v vimx) ]] && alias vim='vimx'

alias cdd='cd -'
alias mkdir='mkdir -p'
alias cp='cp -ir'
alias mv='mv -i'

alias ls='ls --classify --human-readable --group-directories-first --color=auto'
alias ll='ls -l'
alias la='ll --almost-all'

# No 'python' command on Fedora 30+!
if [[ ! -x $(command -v python) && -x $(command -v python3) ]]; then
    alias python='python3'
fi

[[ -z "$TOOLBOX_PATH" ]] && alias te='toolbox enter'
