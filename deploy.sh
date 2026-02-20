#!/usr/bin/env bash
#
# deploy.sh - Setup MacOS CLI tools
#

set -euo pipefail

# Package lists
brew_pkgs=(
    # Basics
    bash
    bash-completion@2
    fd
    fzf
    gettext
    git
    htop
    jq
    neovim
    ripgrep
    stow
    tmux
    tree

    # Programming
    cmake
    ninja
    npm
    lua-language-server
    python
    python-lsp-server
    pipx
    python-argcomplete # required for pipx
    shellcheck

    # DevOps stuff
    argocd
    awscli
    helm
    hashicorp/tap/terraform
    hashicorp/tap/terraform-ls
    k9s
    kubeseal

    # Utils
    ffmpeg
    lowdown
    nmap
    rclone
    restic
    yt-dlp

    # Fonts
    font-hack
    font-iosevka
    font-jetbrains-mono

    # GUI stuff
    aws-vpn-client
    bitwarden
    firefox
    microsoft-teams
    podman-desktop
    signal
    slack
)

npm_pkgs=(
    @ansible/ansible-language-server
    bash-language-server
    vim-language-server
    yaml-language-server
)

pip_pkgs=(
    ansible-dev-tools
)

ruby_gems=(
    puppet-lint@3.4.0
    webrick
)

# 0. Upgrade - bypass initial install stuff
# =============================================================================
if [[ ${1:-} =~ up(grade|date) ]]; then
    brew update
    pipx upgrade-all

    # Useful info for npm updates
    npm_outdated=$(npm outdated --global)

    if [[ -n $npm_outdated ]]; then
        npm update --global
    fi

    # Only update non-versioned gems
    for gem in "${ruby_gems[@]}"; do
        if [[ $gem != *@* ]]; then
            gem update "$gem"
        fi
    done

    exit
fi

# 1. Global packages
# =============================================================================
if ! type brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv bash)"
fi

brew install "${brew_pkgs[@]}"

# These end up in the /opt/homebrew tree!
npm install --global --loglevel info "${npm_pkgs[@]}"

# 2. Dotfiles
# =============================================================================
echo "Linking dotfiles"
find -- * -type d -maxdepth 0 -print -exec stow -t "$HOME" {} \;

# 3. User packages
# =============================================================================
bindir="${HOME}/.local/bin"

pipx install "${pip_pkgs[@]}"

# Trickery required for versioned gems...
for gem in "${ruby_gems[@]}"; do
    if [[ $gem == *@* ]]; then
        gem_name="${gem%@*}"
        gem_ver="${gem#*@}"

        gem install "$gem_name" -v "$gem_ver"
    else
        gem install "$gem"
    fi
done

# 4. Misc tidying up
# =============================================================================
# Symlinking the individual binaries in ansible-dev-tools :)
adt_bindir="${HOME}/.local/pipx/venvs/ansible-dev-tools/bin"

for i in "${adt_bindir}"/ansible*; do
    ln -fs "$i" "$bindir"
done
