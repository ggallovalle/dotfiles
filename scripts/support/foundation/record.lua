local pairs = pairs
_ENV = nil

local Record = {}

function Record.map(f, table)
    local acc = {}
    for index, value in pairs(table) do
        acc[index] = f(value, index, table)
    end
    return acc
end

function Record.filter(f, t)
    local acc = {}
    for index, value in pairs(t) do
        if f(value, index, t) then
            acc[index] = value
        end
    end
    return acc
end

function Record.reduce(reducer, initial, table)
    local acc = initial
    for _, value in pairs(table) do
        acc = reducer(acc, value)
    end
    return acc
end

return Record
