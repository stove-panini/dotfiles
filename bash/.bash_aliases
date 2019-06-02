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

# No 'python' command on Fedora 30+!
if [[ ! -x $(command -v python) && -x $(command -v python3) ]]; then
    alias python='python3'
fi

vim_alternatives=('nvim' 'vimx' 'vi')
for vim in "${vim_alternatives[@]}"; do 
    [[ -x $(command -v  "${vim}") ]] && alias vim="${vim}" && break
done
