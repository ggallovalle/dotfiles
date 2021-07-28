local M = {}

function M.reduce(iterator, initial, table)
    local acc = initial
    for _, value in ipairs(table) do
        acc = iterator(acc, value)
    end
    return acc
end

function M.reduceMonoid(monoid, table)
    return M.reduce(monoid.concat, monoid.initial, table)
end

function M.reverse(table)
    local acc = {}
    for i = #table, 1, -1 do
        acc[i] = table[i]
    end
    return acc
end

return M
