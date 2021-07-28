local array = require "array"
local curry2 = require "curry".curry2

local Monoids = {}

local funcLeft = {
    initial = function(value)
        return value
    end,
    concat = function(f, g)
        return function(...)
            return g(f(...))
        end
    end
}

local func = {
    initial = function(value)
        return value
    end,
    concat = function(f, g)
        return function(...)
            return f(g(...))
        end
    end
}

local sum = {
    initial = 0,
    concat = function(a, b)
        return a + b
    end
}

Monoids.reduce =
    curry2(
    function(monoid, table)
        return array.reduce(monoid.concat, monoid.initial, table)
    end
)

Monoids.flow = Monoids.reduce(funcLeft)
Monoids.compose = Monoids.reduce(func)
Monoids.sum = Monoids.reduce(sum)

return Monoids
