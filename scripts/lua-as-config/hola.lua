local function main()
    local env = {}
    local instances = {}
    assert(loadfile("support/config.lua", "t", env))()
    -- construct instances
    for k, v  in pairs(env) do
        if(type(v) == "string") then
            instances[k] = ASDF.new(v)
        end
    end

    for k, v  in pairs(instances) do
        if(getmetatable(v) == ASDF) then
            local result, ok = call(v, "hol")
            print(result)
            if(getmetatable(ok) == NotAFunctionExecption) then
                print("error prix")
            -- else
            --     print(result)
            end
        end
    end
end

-- main()
