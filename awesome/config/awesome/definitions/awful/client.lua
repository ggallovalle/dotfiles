--- @meta

-- [[ NOTE: client.focus 

--- @class awful.Client.Focus.History
local ClientFocusHistory = {}

--- Remove a client from the focus history.
--- @param client awesome.Client # The client that must be removed.
function ClientFocusHistory.delete(client) end

--- Add a client to the focus history.
--- @param client awesome.Client # The client that must be added.
function ClientFocusHistory.add(client) end

--- Get the latest focused client for a screen in history
--- @param screen awesome.Screen|number # The screen.
--- @param index number # 0 will return first candidate, 1 the second, etc.
--- @param filter? fun(client: awesome.Client): boolean # Optional filter.
function ClientFocusHistory.get(screen, index, filter) end

--- Focus the previous client in the history.
function ClientFocusHistory.previous() end

--- @class awful.Client.Focus
local ClientFocus = {}

--- @type awful.Client.Focus.History
ClientFocus.history = nil

--- Focus a client by its relative index.
---@param index number # The index.
---@param client awesome.Client? # Default `ClientGlobal.focus`.
function ClientFocus.byidx(index, client) end

--- Focus a client by the given direction.
--- @param direction gears.geometry.rectangle.direction # The direction.
--- @param client awesome.Client? # Default `ClientGlobal.focus`.
--- @param stacked boolean? # Default `true`. If true, use stacking order (top to bottom).
function ClientFocus.bydirection(direction, client, stacked) end


--- Focus a client by the given direction. Move accross screens.
--- @param direction gears.geometry.rectangle.direction # The direction.
--- @param client awesome.Client? # Default `ClientGlobal.focus`.
--- @param stacked boolean? # Default `true`. If true, use stacking order (top to bottom).
function ClientFocus.global_bydirection(direction, client, stacked) end

-- end client.focus]]

--- @class awful.Client.Urgent
local ClientUrgent = {}

--- Get the first client that got the urgent hint.
function ClientUrgent.get() end

--- Jump to the client that received the urgent hint first.
--- @param merge boolean|fun(client: awesome.Client, tag: awesome.Tag)? # Default `false`. If true then merge tags (select the client's first tag additionally) when the client is not visible. If it is a function, it will be called with the client as argument.
function ClientUrgent.jumpto(merge) end

--- @class awful.Client.Swap
local ClientSwap = {}

--- Swap a client with another client in the given direction
--- @param direction gears.geometry.rectangle.direction # The direction.
--- @param client awesome.Client? # Default `ClientGlobal.focus`.
--- @param stacked boolean? # Default `true`. If true, use stacking order (top to bottom).
function ClientSwap.bydirection(direction, client, stacked) end


--- Swap a client with another client in the given direction. Swaps accross screens.
--- @param direction gears.geometry.rectangle.direction # The direction.
--- @param client awesome.Client? # Default `ClientGlobal.focus`.
--- @param stacked boolean? # Default `true`. If true, use stacking order (top to bottom).
function ClientSwap.global_bydirection(direction, client, stacked) end


--- Swap a client by its relative index.
--- @param index number # The index.
--- @param client awesome.Client? # Default `ClientGlobal.focus`.
function ClientSwap.byidx(index, client) end


--- @class awful.Client
local AwfulClient = {}


--- Keep track of focused clients.
--- @type awful.Client.Focus
AwfulClient.focus = nil

--- Keep track of urgent clients.
--- @type awful.Client.Urgent
AwfulClient.urgent = nil

--- Utilities to swap clients.
--- @type awful.Client.Swap
AwfulClient.swap = nil

--- Get the master window
--- @param screen awesome.Screen? # Default `awful.screen.focused()`. The screen.
--- @return awesome.Client # The master client.
function AwfulClient.getmaster(screen) end

--- Restore (unminimize) a random client.
--- @param screen awesome.Screen? # Default `awful.screen.focused()`. The screen.
function AwfulClient.restore(screen) end



return AwfulClient
