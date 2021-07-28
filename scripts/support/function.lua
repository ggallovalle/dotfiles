local array = require("foundation.array")
local record = require("foundation.record")
local is = require("foundation.is")
local monoids = require("monoids")

local Function = {}

function Function.identity(value)
    return value
end

Function.flow = monoids.flow

Function.compose = monoids.compose

function Function.pipe(value, ...)
    return monoids.flow(table.pack(...))(value)
end

function Function.call(table, method, ...)
    local func = table[method]
    if is.func(func) then
        return func(...)
    else
        return nil
    end
end

function Function.map(f)
    return function (table)
        if is.func(table.map) then
            return table:map(f)
        elseif is.array(table) then
            return array.map(f, table)
        elseif is.record(table) then
            return record.map(f, table)
        end
        error("This shit ain't a Functor")
    end
end

function Function.constant(value)
    return function()
        return value
    end
end

Function.constantTrue = Function.constant(true)

Function.constantFalse = Function.constant(false)

Function.constantNil = Function.constant(nil)

function Function.absurd(value)
    return function()
        error("This shit should never be called")
    end
end

return Function
