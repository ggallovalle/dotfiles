local startup = require("packer").startup
local vim_highlightedyank = require("kbroom-config.plugins.vim-highlightedyank")

---@return nil
local function main()
    startup(function(use)
        use "wbthomason/packer.nvim"
        use(vim_highlightedyank)
    end)
end

return main
