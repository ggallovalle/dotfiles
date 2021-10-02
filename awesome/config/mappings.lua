local awful = require("awful")
local gears = require("gears")

local M = {}

---The cache where all the keymaps are registered
local _keymap = {}

local modifier = {
	ALT = "Mod1",
	SUPER = "Mod4",
	SHIFT = "Shift",
	CTRL = "Control",
}

--- @see https://keycode.info/
local key = {
	space = "#32",
	tab = "#9",
	print = "#42",
}
---@class void
---@class AwfulKey

---@alias Action fun(): void

---@class KeyOption
---@field key string the keyboard key to trigger this keybinding
---@field on_press Action callback when key is pressed
---@field on_release Action callback when key is released
---@field name string useful when searching for keybindings
---@field description string useful in `awful.hotkeys_popup`
---@field group string useful in `awful.hotkeys_popup`

---Key bindings with `Ctrl+Shift+Super`
---@param options KeyOption
---@return AwfulKey
function M.ctrl_shift_super(options)
	return gears.table.crush(options, { modifier = { modifier.SUPER } })
end

---Key bindings with `Ctrl+Super`
---@param options KeyOption
---@return AwfulKey
function M.ctrl_super(options)
	return gears.table.crush(options, { modifier = { modifier.CTRL, modifier.SUPER } })
end

---Key bindings with `Shift+Super`
---@param options KeyOption
---@return AwfulKey
function M.shift_super(options)
	return gears.table.crush(options, { modifier = { modifier.SHIFT, modifier.SUPER } })
end

---Key bindings with `Super`
---@param options KeyOption
---@return AwfulKey
function M.super(options)
	return gears.table.crush(options, { modifier = { modifier.SUPER } })
end

---Key bindings with `Super`
---@param name string
---@return fun(options: KeyOption[]): void
function M.group(name)
	return function(options)
		for _, element in ipairs(options) do
			options = gears.table.crush(element, { group = name })
			table.insert(_keymap, awful.key(options))
		end
	end
end

local groups = {
	awesome = M.group("awesome"),
	client = M.group("client"),
	layout = M.group("layout"),
	screan = M.group("screen"),
	tag = M.group("tag"),
	launcher = M.group("launcher"),
}

function M.configure()
	groups.launcher({
		M.super({
			key = "p",
			on_press = function()
				awful.spawn.with_shell("rofi -show combi -combi-modi window,drun")
			end,
			description = "open rofi",
		}),
	})
	return _keymap
end

return M
