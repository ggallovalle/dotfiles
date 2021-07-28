-- this module can't contain dependencies
local function dump(value, indent, subcategory)
  if(type(value) ~= "table") then
    print(value)
    return
  end
  local indent = indent or 2
  local response = '(\n'
  local subcategory = type(subcategory) == 'number' and subcategory or indent
  for key, value in pairs(value) do
    if type(value) == 'table' then
      value = dump(value, indent, subcategory + indent)

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

return dump
