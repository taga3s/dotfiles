#!/bin/zsh
set -euo pipefail

function link_config() {
        mkdir -p "$(dirname "$2")"

        ln -snvf "$(pwd)/.config/$1" "$2" 
}

XDG_CONFIG_HOME="${CONFIG_PATH:-$HOME/.config}"

typeset -A pairs
pairs=(
        homebrew/Brewfile "$HOME/.homebrew/Brewfile"
        wezterm "$XDG_CONFIG_HOME"
        starship/starship.toml "$XDG_CONFIG_HOME"
        nvim "$XDG_CONFIG_HOME"
        git "$XDG_CONFIG_HOME"
        gh/config.yml "$XDG_CONFIG_HOME/gh/config.yml"
        zsh/.zshrc "$HOME"
)

for key in ${(k)pairs}; do
  link_config $key $pairs[$key]
done

