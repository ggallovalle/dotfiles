local pairs = pairs
local table = table
_ENV = nil

local Record = {}

function Record.reduce(reducer, initial, t)
    local acc = initial
    for index, value in pairs(t) do
        acc = reducer(acc, value, index, t)
    end
    return acc
end

function Record.map(f, t)
    return Record.reduce(function (acc, curr, index, t2)
        acc[index] = f(curr, index, t2)
        return acc
    end, {}, t)
end

function Record.filter(f, t)
    return Record.reduce(function (acc, curr, index, t2)
        if f(curr, index, t2) then
            acc[index] = curr
        end
        return acc
    end, {}, t)
end


return Record
