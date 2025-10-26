--- @meta

--- @class WeztermConfig
--- @field color_scheme string   # The color scheme to use
--- @field default_prog string[] # The default program to run on startup

--- @class WeztermKeymap
--- @field key string   # The key that activates the map
--- @field mods string  # The mods that goes before the key
--- @field action any   # The wezterm action

--- @class Wezterm
--- The wezterm module is the primary module that exposes wezterm configuration
--- and control of your configuration file
local wezterm = {}

--- @type string
--- This constant is set to the wezterm version string that is also reported
--- when running `wezterm -V`.
--- The version string looks like `20200406-151651-5b700e4`
wezterm.version = nil


--- @type WeztermKeymap[]
wezterm.keys = nil

--- This function logs the provided message string through wezterm's logging layer at 'INFO' level.
--- If you started wezterm from a terminal that text will print to the stdout of that terminal.
--- If running as a daemon for the multiplexer server then it will be logged to the daemon output path.
---@param ... any
function wezterm.log_info(...) end

return wezterm
