local Array = {}

function Array.map(f, table)
    local acc = {}
    for index, value in ipairs(table) do
        acc[index] = f(value, index, table)
    end
    return acc
end

return Array
