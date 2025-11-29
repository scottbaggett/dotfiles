local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.leader = {
  key = "a",
  mods = "CTRL",
  timeout_milliseconds = 2000,
}
config.keys = {
  {
    key = "n",
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = "p",
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(-1),
  },
}
-- Make it look like tabs, with better GUI controls
config.use_fancy_tab_bar = true
-- Don't let any individual tab name take too much room
config.tab_max_width = 32
config.colors = {
  tab_bar = {
    active_tab = {
      -- I use a solarized dark theme; this gives a teal background to the active tab
      fg_color = "#073642",
      bg_color = "#2aa198",
    },
  },
}
-- Switch to the last active tab when I close a tab
config.switch_to_last_active_tab_when_closing_tab = true
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 15.0
config.window_background_opacity = 0.94
config.macos_window_background_blur = 20
config.color_scheme = "Aura"
config.hide_tab_bar_if_only_one_tab = true
config.native_macos_fullscreen_mode = false
config.line_height = 1.24
return config
