local curry2 = require("curry").curry2
local func = require("function")
local array = require("foundation.array")

local PointFree = {}

PointFree.map = curry2(func.map)
PointFree.filter = curry2(func.filter)


return PointFree