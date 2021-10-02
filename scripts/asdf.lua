local ASDF = { name = "" }
ASDF.__index = ASDF

function ASDF.new(name)
    local o = { name = name }
    setmetatable(o, ASDF)
    return o
end

function ASDF:setup()
    local cmd = io.popen("asdf plugin add " .. self.name)
    cmd:close()
end

-- main()
