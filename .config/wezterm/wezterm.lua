local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.automatically_reload_config = true
config.colors = {
  cursor_bg = '#bbbbbb',
  cursor_fg = '#1a1a1a',
  cursor_border = '#bbbbbb',
}
config.font_size = 12.0
config.initial_cols = 160
config.initial_rows = 40
config.show_new_tab_button_in_tab_bar = false
config.use_ime = true
config.window_background_opacity = 0.85
config.window_decorations = "RESIZE"

-- Set position center when starting up
wezterm.on("gui-startup", function(cmd)
  local screen = wezterm.gui.screens().active
  local ratio = 0.5
  local width, height = screen.width * ratio, screen.height * ratio

  local tab, pane, window = wezterm.mux.spawn_window {
    position = {
      x = (screen.width - width) / 2,
      y = (screen.height - height) / 2,
      origin = 'ActiveScreen'
    }
  }
end)

return config
