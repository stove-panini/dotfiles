#
# ~/.bash_aliases: command aliases and functions
#

alias cdd='cd -'
alias mkdir="mkdir -p"
alias cp="cp -ir"
alias mv="mv -i"
alias q="exit"

ls_options='-F -h --group-directories-first --color=auto'
alias ls="ls ${ls_options}"
alias ll="ls ${ls_options} -l"
alias la="ls ${ls_options} -lA"

_bash_prompt() {
    num_colors="${1}"

    # 0/8  - Black     4/12 - Blue
    # 1/9  - Red       5/13 - Magenta
    # 2/10 - Green     6/14 - Cyan
    # 3/11 - Yellow    7/15 - White

    local color1=12
    local color2=4
    local color3=15

    if [[ "${USER}" = root ]]; then
        color1=9
        color2=1
        color3=1
    elif [[ "${SSH_TTY}" ]]; then
        color1=10
        color2=2
        color3=15
    fi
    
    if (( ${num_colors} > 8 )); then
        export PS1="\[$(tput setaf ${color1})\]\u\[$(tput setaf ${color2})\]@\h \[$(tput setaf ${color3})\][\w]\n\$ \[$(tput sgr0)\]"
    fi
}

_bash_prompt "$(tput colors)"
