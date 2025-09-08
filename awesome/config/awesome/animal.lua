local setmetatable = setmetatable

_ENV = nil

---@class Animal
---@field specie string
---@field color string
local Animal = {}

---@class Private : Animal
---@field _age number

local Companion = {}

---Animals can also say to its owner that it already poped
---@param owner string
---@return string
function Companion.give_poop(owner)
	return "Heres your poop" .. owner .. ". Thanks!"
end

---Constructor for `Animal` class
---@param specie string
---@param color string
---@return Animal
function Companion.init(specie, color)
	---@type Private
	local o = {}
	setmetatable(o, { __index = Animal })
	o.specie = specie
	o.color = color
	return o
end

-- Animal.new = constructor

---Animals can speak in their own ways.
---@param to string
---@return string
function Animal:speak(to)
	return "Specie: " .. self.specie .. " with Color: " .. self.color .. " speak To: " .. to
end

return setmetatable(Companion, {
	-- constructor
	__call = function(___, ...)
		return Companion.init(...)
	end,
})

-- Example:
-- local Animal = require("animal")

-- local cat_yellow = Animal.init("cat", "yellow")
-- local cat_black = Animal.init("cat", "green")
-- ---@type Animal
-- -- local cat_black = Animal("cat", "green")
-- local dog_white = Animal.init("dog", "white")
-- local dog_brown = Animal.init("dog", "brown")

-- print(cat_yellow:speak(cat_black.specie))
-- print(dog_white:speak(dog_brown.specie))
-- print(dog_white:speak(cat_yellow.specie))

-- -- print(Animal.give_poop("Alfredo"))
-- print(Animal.give_poop("Alfredo"))
