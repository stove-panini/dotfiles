#
# ~/.bash_aliases: command aliases and functions
#

_ls() {
    local ls_options=(
      '--classify'
      '--human-readable'
      '--group-directories-first'
      '--color=auto'
    )

    for arg in "$@"; do
        ls_options+=("$arg")
    done

    /usr/bin/ls "${ls_options[@]}"
}

_vim() {
    local vim
    local vim_pref_order=('nvim' 'vimx' 'vim' 'vi')

    for vim in "${vim_pref_order[@]}"; do
        if [[ -x $(command -v "$vim") ]]; then
            chosen_vim="$vim"
            break
        fi
    done

    "$chosen_vim" "$@"
}

alias cdd='cd -'
alias mkdir='mkdir -p'
alias cp='cp -ir'
alias mv='mv -i'

alias ls='_ls'
alias ll='ls -l'
alias la='ll --almost-all'

alias vim='_vim'

# No 'python' command on Fedora 30+!
if [[ ! -x $(command -v python) && -x $(command -v python3) ]]; then
    alias python='python3'
fi

[[ -z "$TOOLBOX_PATH" ]] && alias te='toolbox enter'
