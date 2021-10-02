---@diagnostic disable-next-line: undefined-global
local vim = vim
local opts = require("kbroom-config.options")

-- Theme inspired by Atom
return {
    "joshdick/onedark.vim",
    config = function()
        opts.buffer({
            termguicolors = true,
        })
        opts.global({
            onedark_terminal_italics = 2,
        })
        vim.cmd([[colorscheme onedark]])
    end,
}
