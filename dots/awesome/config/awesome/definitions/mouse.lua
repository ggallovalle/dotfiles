--- @meta

--- @type Mouse
_G.mouse = {}

--- @class Mouse : awesome.Object
--- See:
--- [luaL_Reg](https://github.com/awesomeWM/awesome/blob/9b1246af3da71910e84cd446e1b973b384ce0fac/luaa.c#L1091)
--- | [Docs](https://awesomewm.org/doc/api/libraries/awesome.html)
local Mouse = {}


--- @type awesome.Screen
--- The screen under the cursor.
Mouse.screen = nil
