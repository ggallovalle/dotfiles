local ipairs = ipairs
local table = table
_ENV = nil

local Array = {}

function Array.reduce(reducer, initial, t)
    local acc = initial
    for index, value in ipairs(t) do
        acc = reducer(acc, value, index, t)
    end
    return acc
end

function Array.reduceRight(reducer, initial, table)
    local acc = initial
    for i = #table, 1, -1 do
        acc = reducer(acc, table[i])
    end
    return acc
end

function Array.map(f, t)
    return Array.reduce(function (acc, curr, index, t2)
        acc[index] = f(curr, index, t2)
        return acc
    end, {}, t)
end


function Array.filter(f, t)
    return Array.reduce(function (acc, curr, index, t2)
        if f(curr, index, t2) then
            acc[index] = curr
        end
        return acc
    end, {}, t)
end

function Array.reverse(table)
    local acc = {}
    for i = #table, 1, -1 do
        acc[i] = table[i]
    end
    return acc
end

return Array
