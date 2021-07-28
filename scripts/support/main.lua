local math = math
local dump = require("foundation").dump
local pipe = require("foundation").pipe
local filter = require("foundation").filter
local map = require("foundation").map
_ENV = nil

local function add1(x)
    dump("add" .. " >> " .. x)
    return x + 1
end

local function multiply1(x)
    dump("multiply" .. " >> " .. x)
    return x * 1
end

local function substract(x)
    dump("substract" .. " >> " .. x)
    return x - 1
end

local function pi(x)
    dump("pi" .. " >> " .. x)
    return math.pi * x
end

local function main()
    local result =
        pipe(
        {one = 1, two = 2, three = 3},
        map(add1),
        map(multiply1),
        filter(
            function(value)
                return value % 2 == 0
            end
        ),
        map(substract)
    )
    -- local result = {1,2,3} + {5,6,7}
    dump(result, "result")
end

main()
