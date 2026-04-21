--- @meta


--- @class awful.Key.Options
--- @field description string? # A description of the key binding.
--- @field group string? # A group name for the key binding.



--- @class awful.Key
--- @overload fun(mods: table, key: string, press: fun(client: awesome.Client), release: fun(client: awesome.Client)): awful.Key
--- @overload fun(mods: table, key: string, press: fun(client: awesome.Client), options: awful.Key.Options): awful.Key
local Key = {}

return Key

