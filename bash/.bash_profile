#
# ~/.bash_profile
#

# Source user bashrc when running interactively
if [[ $- == *i* && -f ~/.bashrc ]]; then
    source ~/.bashrc
fi

# History options
export HISTCONTROL='ignoreboth:erasedups'

# Editor preference list
for editor in nvim vimx vim vi nano; do
    if type $editor &>/dev/null; then
        export EDITOR="$editor"
        break
    fi
done

# Home bin dir
PATH="$HOME/.local/bin:$PATH"

# Homebrew (MacOS)
if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv bash)"

    if [[ -r /opt/homebrew/etc/profile.d/bash_completion.sh ]]; then
        source /opt/homebrew/etc/profile.d/bash_completion.sh
    fi

    export HOMEBREW_NO_EMOJI=1 HOMEBREW_NO_ENV_HINTS=1
fi

# pipx
if type pipx &>/dev/null; then
    eval "$(register-python-argcomplete pipx)"

    export PIPX_USE_EMOJI="false"
fi

# Install gems to user dir by default
if type gem &>/dev/null; then
    GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
    export GEM_HOME

    PATH="$(ruby -e 'puts Gem.bindir'):$PATH"
fi

# Rust
if type cargo &>/dev/null; then
    PATH="${HOME}/.cargo/bin:$PATH"
fi

# Go
if type go &>/dev/null; then
    export GOPATH="${HOME}/Projects/go"
    PATH="${HOME}/Projects/go/bin:$PATH"
fi

# FZF
if type fzf &>/dev/null; then
    eval "$(fzf --bash)"

    fd_opts='--strip-cwd-prefix --hidden'
    fd_excludes="--exclude .git --exclude .terraform --exclude .ansible"

    export FZF_DEFAULT_COMMAND="fd --type f $fd_opts $fd_excludes"
    export FZF_ALT_C_COMMAND="fd --type d $fd_opts $fd_excludes"
    export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

    unset fd_opts fd_excludes
fi

export PATH
