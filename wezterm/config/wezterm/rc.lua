local wezterm = require("wezterm")

wezterm.log_info("version is ok ", wezterm.version)

--- @type WeztermConfig
local config = {
  color_scheme = "Gruvbox Dark",
  default_prog = { "nu" }
}

return config
