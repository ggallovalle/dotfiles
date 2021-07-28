local pipe = require "function".pipe

local function add1(x)
    print("add", ">>", x)
    return x + 1
end

local function multiply1(x)
    print("multiply", ">>", x)
    return x * 1
end

local function substract(x)
    print("substract", ">>", x)
    return x - 1
end


local function pi(x)
    print("pi", ">>", x)
    return math.pi * x
end

local function main()
    local result = pipe(10, add1, multiply1, substract, pi)
    -- local result = {1,2,3} + {5,6,7}
    print(result)
end

main()
