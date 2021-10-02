local setmetatable = setmetatable
local is = require("foundation.is")
local pipe = require("foundation.pointfree").pipe
_ENV = nil

local Some = { _tag = "Some", _value = {} }
Some.__index = Some
function Some.new(value)
    local o = { _value = value, _tag = "Some" }
    setmetatable(o, Some)
    return o
end

local function some(value)
    return Some.new(value)
end

function Some:get()
    return self._value
end

local None = { _tag = "None" }
local function none()
    return None
end

local Option = Some.new()
Option.__index = Option

function Option.new(value)
    local o
    if is.any(value) then
        o = some(value)
    else
        o = None
    end
    setmetatable(o, Option)
    return o
end

function Option:map(f)
    if is.none(self) then
        return self
    end
    if is.some(self) then
        return pipe(self:get(), f, Option.new)
    end
end

function Option:fold(nonec, somec)
    if is.some(self) then
        return somec(self._value:get())
    else
        return nonec()
    end
end

return {
    Option = Option,
    Some = Some,
    None = None,
    some = some,
    none = none,
}
