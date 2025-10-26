local M = {}

function M.parse_screen(lines)
    local screens = { screens = {} }
    for _, line in ipairs(lines) do
        local words = {}
        for word in line:gmatch("%S+") do
            table.insert(words, word)
        end
        if words[1] == "Screen" then
            local screen = {}
            for i = 2, #words do
                if words[i] == "maximum" then
                    screen[words[i]] = { tonumber(words[i+1]), tonumber(words[i+3]) }
                end
                if words[i] == "minimum" or words[i] == "current" then
                    -- remove last comma
                    local last = words[i+3]:sub(1, -2)
                    screen[words[i]] = { tonumber(words[i+1]), tonumber(last) }
                end
            end
            table.insert(screens.screens, screen)
        end
    end
    return screens
end

return M
