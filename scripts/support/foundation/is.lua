local setmetatable = setmetatable
local table = table
local getmetatable = getmetatable
local type = type
_ENV = nil

--#region [ circular dependencies , forced to copy paste
local Curry = { }

Curry.__index = Curry

function Curry.new(table)
    -- table[1] = function
    -- table[2] = argc - the number of arguments
    local o = table
    -- NOTE circular dependency
    -- if not Is.func(table[1]) or not Is.number(table[2]) then
    --     error("This shit can't be curried")
    -- end
    setmetatable(o, Curry)
    return o
end

local function curryN(func, argc)
    return Curry.new({func, argc})
end

local function curry2(func)
    return curryN(func, 2)
end

function Curry.__call(me, ...)
    local args = table.pack(...)
    local func = me[1]
    local argc = me[2]
    local argsdiff = argc - args.n
    if argsdiff > 0 then
        return function (...)
            return func(table.unpack(args), ...)
        end
    else
        return func(...)
    end

end

--#endregion ]
local Is = {}

function Is.null(value) 
    return type(value) == "nil"
end

function Is.any(value) 
    return not Is.null(value)
end

function Is.func(value) 
    return type(value) == "function"
end

function Is.string(value)
    return type(value) == "string"
end

function Is.boolean(value)
    return type(value) == "boolean"
end

function Is.number(value)
    return type(value) == "number"
end

function Is.array(value)
    return type(value) == "table" and Is.any(value[1])
end

function Is.record(value)
    return type(value) == "table" and Is.null(value[1])
end

Is.type = curry2(function(metatable, value)
    return getmetatable(value) == metatable
end)

function Is.monoid(value)
    return Is.record(value) and Is.any(value.empty) and Is.any(value.concat)
end

Is.union = curry2(function(tag, value)
    return Is.string(value._tag) and value._tag == tag
end)

Is.some = Is.union("Some")
Is.none = Is.union("None")

return Is