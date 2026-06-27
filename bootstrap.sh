#!/bin/bash
set -euo pipefail

function link_config() {
        mkdir -p "$(dirname "$2")"

        ln -snvf "$(pwd)/.config/$1" "$2" 
}

XDG_CONFIG_HOME="${CONFIG_PATH:-$HOME/.config}"

link_config homebrew/Brewfile "$HOME/.homebrew"
link_config wezterm/wezterm.lua "$XDG_CONFIG_HOME/wezterm"
link_config starship/starship.toml "$XDG_CONFIG_HOME"
link_config nvim/init.lua "$XDG_CONFIG_HOME/nvim"
link_config git/ignore "$XDG_CONFIG_HOME/git"

