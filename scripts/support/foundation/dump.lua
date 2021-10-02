local type = type
local print = print
local string = string
local tostring = tostring
local tonumber = tonumber
local pairs = pairs
local is = require("foundation.is")
local colors = require("foundation.ansicolors")
_ENV = nil

local function message(config)
    if is.string(config) then
        return colors("\t%{underline}" .. config)
    elseif config and config.header then
        if is.any(config.file) then
            return "\tconfig"
        end
        return colors("\t%{underline}" .. config.header)
    end
end

local function dump(value, config)
    if type(value) ~= "table" then
        print(value)
        return
    end
    local msg = message(config)
    if is.string(msg) then
        print(msg)
    end
    local indent = config.indent or 2
    local response = "{\n"
    local subcategory = type(config.subcategory) == "number"
            and config.subcategory
        or indent
    for key, value in pairs(value) do
        if type(value) == "table" then
            value = dump(
                value,
                { indent = indent, subcategory = subcategory + indent }
            )
        elseif type(value) == "string" then
            value = "'" .. value .. "'"
        elseif type(value) ~= "number" then
            value = tostring(value)
        end

        if type(tonumber(key)) == "number" then
            key = "[" .. key .. "]"
        elseif not key:match("^([A-Za-z_][A-Za-z0-9_]*)$") then
            key = "['" .. key .. "']"
        end
        response = response
            .. string.rep(" ", subcategory)
            .. key
            .. " = "
            .. value
            .. ",\n"
    end
    local final = response .. string.rep(" ", subcategory - indent) .. "}"
    print(final)
end

return dump
