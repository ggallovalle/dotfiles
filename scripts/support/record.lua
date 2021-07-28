local Dict = {}

function Dict.map(f, table)
    local acc = {}
    for index, value in pairs(table) do
        acc[index] = f(value, index, table)
    end
    return acc
end

return Dict
