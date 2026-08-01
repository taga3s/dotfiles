#!/bin/bash
set -euo pipefail

function link_config() {
        mkdir -p "$(dirname "$2")"

        ln -snvf "$(pwd)/.config/$1" "$2" 
}

XDG_CONFIG_HOME="${CONFIG_PATH:-$HOME/.config}"

link_config homebrew/Brewfile "$HOME/.homebrew/Brewfile"
link_config wezterm "$XDG_CONFIG_HOME"
link_config starship/starship.toml "$XDG_CONFIG_HOME"
link_config nvim "$XDG_CONFIG_HOME"
link_config git "$XDG_CONFIG_HOME"
link_config gh/config.yml "$XDG_CONFIG_HOME/gh/config.yml"
