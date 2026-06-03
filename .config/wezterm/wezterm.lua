local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.automatically_reload_config = true
config.font_size = 12.0
config.use_ime = true
config.window_background_opacity = 0.85
config.window_decorations = "RESIZE"
config.show_new_tab_button_in_tab_bar = false
config.colors = {
  cursor_bg = '#bbbbbb',
  cursor_fg = '#1a1a1a',
  cursor_border = '#bbbbbb',
}

return config
