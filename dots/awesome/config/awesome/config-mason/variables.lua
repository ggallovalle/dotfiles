-- Standard awesome library
local gears = require("gears")
local beautiful = require("beautiful")

local xrandr = require("xrandr")
local gears = require("gears")

local HOME = os.getenv("HOME")
local WALLPAPER = HOME .. "/Pictures/wallpapers/"
local wallpapers = {
  WALLPAPER .. "deno-vv-3840x2400.jpg",
  WALLPAPER .. "node.png",
  -- HOME .. "/Pictures/wallpapers/ocarina.jpg"
}

local vertical_wallpapers = {
  WALLPAPER .. "v-star.jpg",
}

local function is_vertical(s)
  local xrandr_output_name = gears.table.keys(s.outputs)[1]
  local decoded = xrandr.real_result()
  local xrandr_info = decoded[xrandr_output_name]
  local p_orientation = xrandr_info["orientation"]

  if p_orientation == "right" or p_orientation == "left" then
    return true
  else
    return false
  end

end

---
---@param s awesome.Screen
---@return string
local function wallpaper(s)
    if is_vertical(s) then
      return vertical_wallpapers[1]
    else
      return wallpapers[s.index]
    end
end


-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.wallpaper = wallpaper
-- beautiful.wallpaper = require("user.themes.default").wallpaper

local M = {}
-- This is used later as the default terminal and editor to run.
M.terminal = "kitty"
M.editor = os.getenv("EDITOR") or "nano"
M.editor_cmd = M.terminal .. " -e " .. M.editor

return M
-- }}}