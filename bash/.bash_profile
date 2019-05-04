#
# ~/.bash_profile: executed by bash login shell
#

# Save multi-line commands in one history entry
shopt -s cmdhist

export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"

extra_paths=(
    "${HOME}/.local/bin"
)

for ex_path in "${extra_paths[@]}"; do
    if ! [[ ${PATH} =~ ${ex_path} ]]; then
        export PATH="${ex_path}:${PATH}"
    fi
done


# Source ~/.bashrc if it exists AND we have a bash shell.
[[ "${BASH}" && -f ~/.bashrc ]] && source ~/.bashrc
