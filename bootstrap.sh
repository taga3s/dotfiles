#!/bin/bash
set -euo pipefail

function link_config() {
        mkdir -p "$(dirname "$2")"

        ln -snvf "$(pwd)/.config/$1" "$2" 
}

CONFIG_PATH="${CONFIG_PATH:-$HOME/.config}"

link_config wezterm/wezterm.lua "$CONFIG_PATH/wezterm"
link_config starship/starship.toml "$CONFIG_PATH"
link_config nvim "$CONFIG_PATH/nvim"
