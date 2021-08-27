local startup = require("packer").startup
local vim_highlightedyank = require("kbroom-config.plugins.vim-highlightedyank")

---@return nil
local function main()
    startup(function(use)
        use("wbthomason/packer.nvim")
        use(vim_highlightedyank)
        use("easymotion/vim-easymotion")
        use("tpope/vim-surround")
        use("tpope/vim-commentary")
        use("vim-scripts/ReplaceWithRegister")
				-- for markdown, this has to be in the exact order
				use("godlygeek/tabular")
				use("plasticboy/vim-markdown")
				-- end for markdown
    end)
end

return main
