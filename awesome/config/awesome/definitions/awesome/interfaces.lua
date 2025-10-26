--- @meta

--- @class awesome.Object
local Object = {}

--- Set the `__newindex` metamethod for the object.
--- @param handler fun(ojb: table, key: string, value: any): nil
function Object.set_newindex_miss_handler(handler) end


--- Set the `__index` metamethod for the object.
--- @param handler fun(ojb: table, key: string): nil
function Object.set_index_miss_handler(handler) end


--- @class awesome.Signals
local Signal = {}

--- Connect a signal to a callback.
--- @param name string
--- @param cb fun(...): nil
function Signal:connect_signal(name, cb) end


--- Remove a signal callback.
--- @param name string
--- @param cb fun(...): nil
function Signal:disconnect_signal(name, cb) end


--- Emit a signal.
--- @param name string
--- @param ... any
function Signal:emit_signal(name, ...) end
