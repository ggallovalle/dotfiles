local M = {}

function M.split_words(line)
    local words = {}
    for word in line:gmatch("%S+") do
        table.insert(words, word)
    end
    return words
end

return M
