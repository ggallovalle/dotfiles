local Function = {}

local reduceMonoid = require "iterator".reduceMonoid
local reverse = require "iterator".reverse
local array = require "array"
local record = require "record"
local is = require "is"

function Function.compose(f, g)
    return function (...)
        return f(g(...))
    end
end

function Function.composeLeft(f, g)
    return function (...)
        return g(f(...))
    end
end

function Function.identity(value)
    return value
end

Function.Monoid = {
    initial = Function.identity,
    concat = Function.composeLeft
}

function Function.flow(...)
    local args = table.pack(...)
    args.n = nil
    return reduceMonoid(Function.Monoid, args)
end

function Function.pipe(...)
    local args = table.pack(...)
    local tempo = table.remove(args, 1)
    args.n = nil
    return reduceMonoid(Function.Monoid, args)(tempo)
end

function Function.call(table, method, ...)
    local func = table[method]
    if is.func(func) then
        return func(...)
    else
        return nil
    end
end

function Function.map(f)
    return function (table)
        if is.func(table.map) then
            return table:map(f)
        elseif is.array(table) then
            return array.map(f, table)
        elseif is.record(table) then
            return record.map(f, table)
        end
        error("This shit ain't a Functor")
    end
end

local function parser(value, indent, subcategory)
  local indent = indent or 2
  local response = '(\n'
  local subcategory = type(subcategory) == 'number' and subcategory or indent
  for key, value in pairs(value) do
    if type(value) == 'table' then
      value = parser(value, indent, subcategory + indent)

    elseif type(value) == 'string' then
      value = '\''.. value .. '\''

    elseif type(value) ~= 'number' then
      value = tostring(value)
    end

    if type(tonumber(key)) == 'number' then
        key = '[' .. key .. ']'
   elseif not key:match('^([A-Za-z_][A-Za-z0-9_]*)$') then
      key = '[\'' .. key .. '\']'
    end
    response = response .. string.rep(' ', subcategory) .. key .. ' = ' .. value .. ',\n'
  end
  local final =  response .. string.rep(' ', subcategory - indent) .. ')'
  print(final)

end 

Function.dump = parser

return Function
