local table = table
local curry2 = require("foundation.curry").curry2
local curry3 = require("foundation.curry").curry3
local collection = require("foundation.collection")
local monoids = require("foundation.monoids")
_ENV = nil

local PointFree = {}

PointFree.map = curry2(collection.map)
PointFree.filter = curry2(collection.filter)
PointFree.reduce = curry3(collection.reduce)
PointFree.reduceRight = curry3(collection.reduceRight)
PointFree.flow = monoids.flow
PointFree.compose = monoids.compose
function PointFree.pipe(value, ...)
    return monoids.flow(table.pack(...))(value)
end

return PointFree
