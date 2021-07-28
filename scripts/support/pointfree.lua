local curry2 = require("foundation.curry").curry2
local func = require("function")

local PointFree = {}

PointFree.map = curry2(func.map)
PointFree.filter = curry2(func.filter)


return PointFree
