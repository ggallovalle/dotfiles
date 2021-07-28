-- this module can't contain dependencies
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
    for index, value in ipairs(t) do
        if f(value, index, t) then
            acc[index] = value
        end
    end
    return acc
end

return Record
