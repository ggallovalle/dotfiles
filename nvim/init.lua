local remaps = require("kbroom-config.remaps")
local options = require("kbroom-config.options")

-- local plugins = require("kbroom-config.packer")

-- [[ options

-- Lua --- Vim script variable scope
-- NOTE If any "global" option is an error, just use vim.g
vim.g.mapleader = " "

options.global({
    inccommand = "nosplit",
    hidden = true,
    mouse = "a",
    breakindent = true,
    ignorecase = true,
    smartcase = true, -- case insensitive unless capital letter in search
    termguicolors = true,
    hlsearch = false,
})

options.buffer(0, {
    -- [ identation
    tabstop = 2, -- indent with 2 spaecs
    textwidth = 80,
    shiftwidth = 2,
    autoindent = true,
    expandtab = true,
    undofile = true, -- undo persistance
    -- ]
})

options.window(0, {
    colorcolumn = "+1,+20",
    wrap = true,
    number = true,
    relativenumber = true,
    signcolumn = "number",
})

-- options ]]

-- [[[ mappings

-- [[ root
remaps.n_map({
    { "Y", "y$" }, -- make it behave like D or C
    { "J", "mzJ`z" }, -- join the lines but keep the cursor wherte it is
    { "n", "nzzzv" }, -- keen the screen center when going forward
    { "N", "Nzzzv" }, -- keen the screen center when going backwards
    -- keep k and j in the C-O and C-I go back and forward
    {
        "k",
        '(v:count > 5 ? "m\'" . v:count : "") . \'k\'',
        { expr = true, noremap = true },
    },
    {
        "j",
        '(v:count > 5 ? "m\'" . v:count : "") . \'j\'',
        { expr = true, noremap = true },
    },
})

remaps.i_map({
    { "jj", "<Esc>" }, -- easier escape from insert mode
    -- [ better undo, keeps marks on every specified special character
    { ",", ",<c-g>u" },
    { ".", ".<c-g>u" },
    { "!", "!<c-g>u" },
    { "?", "?<c-g>u" },
    -- ]
})

-- [ move the lines up and down just as in vs code
remaps.v_map({ { "J", ":m '>+1<CR>gv=gv" }, { "K", ":m '<-2<CR>gv=gv" } })
remaps.i_map({
    { "<C-J>", "<esc>:m .+1<CR>==" },
    { "<C-K>", "<esc>:m .-2<CR>==" },
})
remaps.n_map({
    { "<leader>k", ":m .-2<CR>==" },
    { "<leader>j", ":m .+1<CR>==" },
})
-- ]

-- end root ]]

-- [[ leader
remaps.n_map({
    { "<leader><CR>", ":so ~/.config/nvim/init.lua<CR>" }, -- reload init.vim
    { "<leader>Y", 'gg+yG"' }, -- yank all buffer
    { "<leader>w", "<C-w>" }, -- more ergonomic C-w
    { "<leader>y", '"+y' }, -- yank to clipboard
})

remaps.v_map({
    { "<leader>y", '"+y' }, -- yank to clipboard
})
-- ]]

-- mappings ]]]
require("kbroom.config")
