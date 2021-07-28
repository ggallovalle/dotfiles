-- this module can't contain dependencies
local Array = {}

function Array.map(f, table)
    local acc = {}
    for index, value in ipairs(table) do
        acc[index] = f(value, index, table)
    end
    return acc
end

function Array.reduce(reducer, initial, table)
    local acc = initial
    for _, value in ipairs(table) do
        acc = reducer(acc, value)
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

function Array.filter(f, t)
    local acc = {}
    for index, value in ipairs(t) do
        if f(value, index, t) then
            Array["push!"](value, acc)
        end
    end
    return acc
end

Array["push!"] = function(a, table)
    table[#table+1] = a
end

function Array.reverse(table)
    local acc = {}
    for i = #table, 1, -1 do
        acc[i] = table[i]
    end
    return acc
end

return Array
