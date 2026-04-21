---@diagnostic disable: deprecated
--- @meta

--- @class awesome.Dbus : awesome.Signals
--- @deprecated `lgi.GDBus` is always better. This module will eventually be removed
--- Low-level D-bus api.
---
--- See: 
--- [luaL_Reg](https://github.com/awesomeWM/awesome/blob/9b1246af3da71910e84cd446e1b973b384ce0fac/dbus.c#L857)
--- | [Docs](https://awesomewm.org/doc/api/libraries/dbus.html)
--- | [Deprecation](https://github.com/awesomeWM/awesome/blob/9b1246af3da71910e84cd446e1b973b384ce0fac/dbus.c#L22)
local dbus = {}

--- Add a match rule to match messages going through the message bus. 
---
--- See:
--- [Docs](https://awesomewm.org/doc/api/libraries/dbus.html#add_match)
--- | [Source](https://github.com/awesomeWM/awesome/blob/9b1246af3da71910e84cd446e1b973b384ce0fac/dbus.c#L721)
--- @param bus string A string indicating if we are using system or session bus.
--- @param name string A string with the name of the match rule.
function dbus.add_match(bus, name) end


function dbus.release_signal() end


function dbus.remove_match() end


function dbus.request_name() end
