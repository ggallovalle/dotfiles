local error = error
local is = require("foundation.is")
local array = require("foundation.array")
local record = require("foundation.record")
_ENV = nil

local Collection = {}

function Collection.map(f, table)
    if is.func(table.map) then
        return table:map(f)
    elseif is.array(table) then
        return array.map(f, table)
    elseif is.record(table) then
        return record.map(f, table)
    end
    error("This shit ain't a Functor")
end

function Collection.filter(f, table)
    if is.func(table.filter) then
        return table:map(f)
    elseif is.array(table) then
        return array.filter(f, table)
    elseif is.record(table) then
        return record.filter(f, table)
    end
    error("This shit ain't a Filterable")
end

function Collection.reduce(reducer, initial, table)
    if is.array(table) then
        return array.reduce(reducer, initial, table)
    elseif is.record(table) then
        return record.reduce(reducer, initial, table)
    end
    error("This shit ain't a Foldable")
end

function Collection.reduceRight(reducer, initial, table)
    if is.array(table) then
        return array.reduceRight(reducer, initial, table)
    elseif is.record(table) then
        -- in records there is no order that's why there is no such
        -- thing as reduce right
        return record.reduce(reducer, initial, table)
    end
    error("This shit ain't a Foldable")
end

return Collection
