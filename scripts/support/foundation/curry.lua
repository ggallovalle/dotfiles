local type = type
local error = error
local setmetatable = setmetatable
local table = table
_ENV = nil

local Curry = { }

Curry.__index = Curry

function Curry.new(table)
    -- table[1] = function
    -- table[2] = argc - the number of arguments
    local o = table
    if type(table[1]) ~= "function" or type(table[2]) ~= "number" then
        error("This shit can't be curried")
    end
    setmetatable(o, Curry)
    return o
end

local function curryN(func, argc)
    return Curry.new({func, argc})
end

local function curry2(func)
    return curryN(func, 2)
end

local function curry3(func)
    return curryN(func, 3)
end

local function curry4(func)
    return curryN(func, 4)
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

return {
    curryN = curryN,
    curry2 = curry2,
    curry3 = curry3,
    curry4 = curry4
}
