-- this module can only depend on foundation package
local array = require("foundation.array")
local curry2 = require("foundation.curry").curry2

local Monoids = {}

local funcLeft = {
    empty = function(value)
        return value
    end,
    concat = function(f, g)
        return function(...)
            return g(f(...))
        end
    end
}

local func = {
    empty = function(value)
        return value
    end,
    concat = function(f, g)
        return function(...)
            return f(g(...))
        end
    end
}

local sum = {
    empty = 0,
    concat = function(a, b)
        return a + b
    end
}

local product = {
    empty = 1,
    concat = function(a, b)
        return a * b
    end
}

local any = {
    empty = false,
    concat = function (a, b)
        return a or b
    end
}

local all = {
    empty = true,
    concat = function (a, b)
        return a and b
    end
}

Monoids.reduce =
    curry2(
    function(monoid, table)
        return array.reduce(monoid.concat, monoid.empty, table)
    end
)

Monoids.flow = Monoids.reduce(funcLeft)
Monoids.compose = Monoids.reduce(func)
Monoids.sum = Monoids.reduce(sum)
Monoids.product = Monoids.reduce(product)
Monoids.any = Monoids.reduce(any)
Monoids.all = Monoids.reduce(all)

return Monoids
