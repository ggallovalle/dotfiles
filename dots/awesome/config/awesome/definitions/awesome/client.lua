--- @meta

--- @class awesome.ClientGlobal
local ClientStatic = {}

--- The currently focused client.
--- @type awesome.Client?
ClientStatic.focus = nil


--- @class awesome.Client
--- Clients are a process window.
---
--- A process can have many clients (e.g. for dialogs, popups, etc.). or none at all
--- (e.g. for background processes).
local Client = {}

--- @type awesome.Screen
--- The screen this client is on.
Client.screen = nil


--- @type boolean
--- Define if the client must be hidden, i.e. never mapped, invisible in taskbar.
---
--- signal -> `property::hidden`
Client.hidden = nil


--- @type boolean
--- Define if the client is fullscreen.
---
--- signal -> `property::fullscreen`
Client.fullscreen = nil

--- @type boolean
--- Define if the client must be minimized, i.e. only visible in taskbar.
---
--- signal -> `property::minimized`
Client.minimized = nil


--- @type boolean
--- Define if the client is maximized. horizontally and vertically.
---
--- signal -> `property::maximized`
Client.maximized = nil


--- @type boolean
--- Define if the client is maximized horizontally.
---
--- signal -> `property::maximized_horizontal`
Client.maximized_horizontal = nil

--- @type boolean
--- Define if the client is maximized vertically.
---
--- signal -> `property::maximized_vertical`
Client.maximized_vertical = nil


--- @type boolean
--- Define if the client is floating. Floating clients are not managed by the tiling layout.
Client.floating = nil


--- @type boolean
--- Client is on top of every other window.
Client.ontop = nil

--- @type boolean
--- `awful.client.Urgent` subsystem flag.
Client.urgent = nil

-- [[ NOTE: c implementations


--- Get/set the client tag list.
---
--- signal -> `property::tags`
--- @param tags awesome.Tag[]?
--- @return awesome.Tag[]
function Client:tags(tags) end

--- Raise a client on top of otherswich are on the same layer.
function Client:raise() end

--- Chech if a client is visible on its screen.
--- @return boolean
function Client:isvisible() end

--- Kill a client.
function Client:kill() end

--- Swap a client with another one in global client list.
---@param client awesome.Client
function Client:swap(client) end

-- NOTE: END c getters/setters ]]

-- [[ NOTE: awful.client extensions

--- Jump to the given client.
--- Takes care of focussing the screen, the right tag, etc
--- @param merge (boolean|fun(client: awesome.Client, tag: awesome.Tag))? # Default to `false`. Select the client first tag, or pass a merge function.
function Client:jumpt_to(merge) end

--- Move/resize a client relative to current geometry.
--- @param x number # `awesome.ScreenGeometry.x`
--- @param y number # `awesome.ScreenGeometry.y`
--- @param w number # `awesome.ScreenGeometry.width`
--- @param h number # `awesome.ScreenGeometry.height`
function Client:relative_move(x, y, w, h) end

--- Toggle a tag on a client.
--- @param target awesome.Tag
function Client:toggle_tag(target) end

--- Move a client to a tag.
--- @param target awesome.Tag
function Client:move_to_tag(target) end

--- Move a client to a screen.
--- @param target awesome.Screen? # Default to `self.screen.index + 1`
function Client:move_to_screen(target) end

--- Toggle a tag on a client.
--- @param target awesome.Tag
function Client:toggle_tag(target) end

--- Tag a client with the set of currently selected tags.
function Client:to_selected_tags() end


---  NOTE: end awful.client extensions ]]
