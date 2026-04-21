--- @meta


--- @type awesome.Screen[]
_G.screen = {}

--- @class awesome.Screen.Geometry
local ScreenGeometry = {}

--- @type number
--- The horizontal positon
ScreenGeometry.x = nil


--- @type number
--- The vertical positon
ScreenGeometry.y = nil

--- @type number
--- The width
ScreenGeometry.width = nil


--- @type number
--- The height
ScreenGeometry.height = nil


--- @class awesome.Screen
--- @field tags awesome.Tag[]
local Screen = {}


--- @type number
--- The internal screen number.
--- 
--- - The indeces are a continuous sequence from 1 to screen.count().
--- - It is NOT related to the actual screen position relative to each other.
--- - 1 is NOT necessarily the primary screen.
--- - When screens are added and removed indices CAN change.
Screen.index = nil

--- @type awesome.Client[]
--- The list of visible clients for the screen.
---
--- Does not includes:
--- - minimized clients
--- - clients on other tags
Screen.clients = nil

--- @type awesome.Screen.Geometry
--- The screen coordinates
Screen.geometry = nil

--- Get the number of instances
--- @return number
function Screen:instances() end




--- Get the list of visible clients for the screen.
--- @param stacked? boolean # if true, use stacking order (top to bottom), defaults to true
--- @return awesome.Client[]
function Screen:get_clients(stacked) end
