local wezterm = require 'wezterm';

return {
  launch_menu = {
    {
      args = {"top"},
    },
    {
      label = "PowerShell Core",
      args = {"C:\\Users\\laughk\\scoop\\apps\\pwsh\\current\\pwsh.exe"},
    },
    {
      label = "PowerShell Core Preview by Installer",
      args = {"C:\\Program Files\\PowerShell\\7-preview\\preview\\pwsh-preview.cmd"},
    },
    {
      label = "WSL Arch2",
      args = {"C:\\WINDOWS\\system32\\wsl.exe", "-u", "laughk", "--cd", "~"},
    },
    {
      label = "nushell",
      args = {"C:\\Users\\laughk\\scoop\\shims\\nu.exe"}
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
  },

  -- color_scheme = "Bluloco Dark",
  color_scheme = "nord",
  -- color_scheme = "Darcula (base16)",
  window_background_opacity = 0.9,

  font = wezterm.font("UDEV Gothic"),
  font_size = 14.0,

  default_prog = {"C:\\Users\\laughk\\scoop\\shims\\nu.exe"}
}
