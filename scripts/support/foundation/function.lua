local error = error
local is = require("foundation.is")
_ENV = nil

local Function = {}

function Function.identity(value)
    return value
end

function Function.call(table, method, ...)
    local func = table[method]
    if is.func(func) then
        return func(...)
    else
        return nil
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

function Function.absurd()
    return function()
        error("This shit should never be called")
    end
end

return Function
