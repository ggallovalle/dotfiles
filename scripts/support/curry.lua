local is = require "is"
local Curry = { }

Curry.__index = Curry

function Curry.new(table)
    -- table[1] = function
    -- table[2] = argc - the number of arguments
    -- table[3] = varargs - where does the varargs starts
    -- if varargs is equals 0, there is no varargs
    -- if is equals to -1 -2 or so on, is the last n element
    local o = table
    setmetatable(o, Curry)
    return o
end

local function curryN(func, argc, varargs)
    varargs = varargs or 0
    return Curry.new({func, argc, varargs})
end

local function curry2(func, varargs)
    return curryN(func, 2, varargs)
end

local function curry3(func, varargs)
    return curryN(func, 3, varargs)
end

local function curry4(func, varargs)
    return curryN(func, 4, varargs)
end

function Curry.__call(me, ...)
    local args = table.pack(...)
    local func = me[1]
    local argc = me[2]
    -- local varargs = me[3]
    local argsdiff = argc - args.n
    if argsdiff > 0 then
        return function (...)
            return func(table.unpack(args), ...)
        end
    else
        return func(...)
    end

end

local function add(a, b)
    return a + b
end

local function main()
    local curriedAdd = curry2(add)
    local add2 = curriedAdd(2)
    -- local add3 = curriedAdd(3)
    print(add2(0))
    print(curriedAdd(1,2))
    -- print(add3(0))
end

-- main()

return {
    curryN = curryN,
    curry2 = curry2,
    curry3 = curry3,
    curry4 = curry4
}
