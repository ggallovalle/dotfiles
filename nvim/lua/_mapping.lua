---@diagnostic disable-next-line: undefined-global
local vim = vim

local map_opts = {noremap = true, silent = true}
local key_map = vim.api.nvim_set_keymap

---@param options string[][]
---@return nil
local function nvmap(options)
    for _, mapper in ipairs(options) do
        key_map("n", mapper[1], mapper[2], mapper[3] or map_opts)
        key_map("v", mapper[1], mapper[2], mapper[3] or map_opts)
    end
end

---@param options string[][]
---@return nil
local function imap(options)
    for _, mapper in ipairs(options) do
        key_map("i", mapper[1], mapper[2], mapper[3] or map_opts)
    end
end

---@return nil
local function main()
    imap {
        -- easier escape from insert mode
        {"jj", "<Esc>"}

    }

    nvmap {
        -- more ergonomic C-w
        {"<leader>w", "<C-w>"}
    }
end

return main
