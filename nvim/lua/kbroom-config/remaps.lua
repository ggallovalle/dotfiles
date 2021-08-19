---@diagnostic disable-next-line: undefined-global
local vim = vim

local map_opts = {noremap = true, silent = true}

---@param options string[][]
---@return nil
local function n_map(options)
    for _, mapper in ipairs(options) do
        vim.api
            .nvim_set_keymap("n", mapper[1], mapper[2], mapper[3] or map_opts)
    end
end

---@param options string[][]
---@return nil
local function v_map(options)
    for _, mapper in ipairs(options) do
        vim.api
            .nvim_set_keymap("v", mapper[1], mapper[2], mapper[3] or map_opts)
    end
end

---@param options string[][]
---@return nil
local function nv_map(options)
    for _, mapper in ipairs(options) do
        vim.api
            .nvim_set_keymap("n", mapper[1], mapper[2], mapper[3] or map_opts)
        vim.api
            .nvim_set_keymap("v", mapper[1], mapper[2], mapper[3] or map_opts)
    end
end

---@param options string[][]
---@return nil
local function i_map(options)
    for _, mapper in ipairs(options) do
        vim.api
            .nvim_set_keymap("i", mapper[1], mapper[2], mapper[3] or map_opts)
    end
end

---@return nil
local function main()
    n_map {
        {"<leader><CR>", ":so ~/.config/nvim/init.vim<CR>"}, -- reload init.vim
        {"Y", "y$"}, -- make it behave like D or C
        {"J", "mzJ`z"}, -- join the lines but keep the cursor wherte it is
        {"n", "nzzzv"}, -- keen the screen center when going forward
        {"n", "nzzzv"}, -- keen the screen center when going backwards
        -- keep k and j in the C-O and C-I go back and forward
        {
            "k", "(v:count > 5 ? \"m'\" . v:count : \"\") . 'k'",
            {expr = true, noremap = true}
        }, {
            "j", "(v:count > 5 ? \"m'\" . v:count : \"\") . 'j'",
            {expr = true, noremap = true}
        }
    }

    i_map {
        {"jj", "<Esc>"}, -- easier escape from insert mode 
        -- better undo, keeps marks on every specified special character
        {",", ",<c-g>u"}, {".", ".<c-g>u"}, {"!", "!<c-g>u"}, {"?", "?<c-g>u"}
    }

    nv_map {
        {"<leader>w", "<C-w>"} -- more ergonomic C-w
    }

    -- [[ combos 
    -- [ move the lines up and down just as in vs code
    v_map {{"J", ":m '>+1<CR>gv=gv"}, {"K", ":m '<-2<CR>gv=gv"}}
    i_map {{"<C-J>", "<esc>:m .+1<CR>=="}, {"<C-K>", "<esc>:m .-2<CR>=="}}
    n_map {{"<leader>k", ":m .-2<CR>=="}, {"<leader>j", ":m .+1<CR>=="}}
    -- ]
    -- end combos]]
end

return main
