--- @meta

--- @class awful.Screen
local AwfulScreen = {}


--- Get the focused screen.
---
--- It is possible to set `awful.screen.default_focused_args` to override the default settings.
--- @param options? { client?: boolean, mouse?: boolean } # `options.client` use the client screen instead of the mouse screen
--- @return awesome.Screen # The focused screen.
function AwfulScreen.focused(options) end

--- Move the focus toa screen relative to the current one.
---
--- This moves the mosue pointer to the last known position on the new screen,
--- or keepts its position relative to the current focused screen.
--- @param offset number # The offset. 1 is the next screen, -1 the previous one.
function AwfulScreen.focus_relative(offset) end


--- Call a function for each existng and created in the future screen.
--- @param cb fun(screen: awesome.Screen)
function AwfulScreen.connect_for_each_screen(cb) end

return AwfulScreen
