local wezterm = require 'wezterm';

return {
  launch_menu = {
    {
      args = {"top"},
    },
    {
      label = "nushell",
      args = {"/opt/homebrew/bin/nu"}
    },
  },

  keys = {
    -- This will create a new split and run your default program inside it
    {
      key = '"',
      mods = 'ALT',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    -- This will create a new split and run the `top` program inside it
    {
      key = '%',
      mods = 'ALT',
      action = wezterm.action.SplitPane {
        direction = 'Left',
        command = { args = { 'top' } },
        size = { Percent = 50 },
      },
    },
    -- disable ctrl+shift+u
    {
      key = 'U',
      mods = 'CTRL',
      action = wezterm.action.DisableDefaultAssignment,
    },
    {
      key = "w",
      mods = "CTRL",
      action = wezterm.action.DisableDefaultAssignment,
    },
  },

  send_composed_key_when_left_alt_is_pressed = false,
  send_composed_key_when_right_alt_is_pressed = false,
  -- color_scheme = "Bluloco Dark",
  color_scheme = "nord",
  -- color_scheme = "Darcula (base16)",
  window_background_opacity = 0.9,

  -- font = wezterm.font("UDEV Gothic"),
  font = wezterm.font("PlemolJP Console"),
  font_size = 16.0,

  -- default_prog = {"/opt/homebrew/bin/zsh"}
}
