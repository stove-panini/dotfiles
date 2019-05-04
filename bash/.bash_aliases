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