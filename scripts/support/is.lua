local Is = {}

function Is.null(value) 
    return type(value) == "nil"
end

function Is.any(value) 
    return not Is.null(value)
end

function Is.func(value) 
    return type(value) == "function"
end

function Is.string(value)
    return type(value) == "string"
end

function Is.boolean(value)
    return type(value) == "boolean"
end

function Is.number(value)
    return type(value) == "number"
end

function Is.array(value)
    return type(value) == "table" and Is.any(value[1])
end

function Is.record(value)
    return type(value) == "table" and Is.null(value[1])
end

function Is.type(value, metatable)
    return getmetatable(value) == metatable
end

function Is.monoid(value)
    return Is.record(value) and Is.any(value.initial) and Is.any(value.concat)
end

function Is.union(value, tag)
    if Is.string(tag) then
        return Is.string(value._tag) and value._tag == tag
    end
    return Is.string(value._tag)
end

function Is.container(value)
    return Is.any(value._value)
end
function Is.some(value)
    -- if M.container(value) then
    --     return M.union(value._value, "Some")
    -- end
    return Is.union(value, "Some")
end

function Is.none(value)
    -- if M.container(value) then
    --     return M.union(value._value, "None")
    -- end
    return Is.union(value, "None")
end

return Is