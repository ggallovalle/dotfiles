local M = {}

local map_opts = { noremap = true, silent = true }

--`:nnoremap` utilities for global environment.
--- Example:
--- ```
--- --- You can map multiple commands at a time for such mode
--- n_map({{"C-A", ":lua run()", { noremap = false }}})
--- --- :nnormemap <C
--- ```
---@param options string[][] where [1] is the mapping, [2] is the command and [3] is options such as noremap or silent
---@return nil
function M.n_map(options)
    for _, mapper in ipairs(options) do
        vim.api.nvim_set_keymap(
            "n",
            mapper[1],
            mapper[2],
            mapper[3] or map_opts
        )
    end
end

-- Normal mode ,a[[omg]] utilities for current buffer.
--- Example:
--- ```
--- -- You can map multiple commands at a time for such mode
--- -- :nnoremap <C-A> :lua run()
--- buf_n_map(bufnr, {{"<C-A>", ":lua run()", { noremap = false }}})
--- ```
---@param bufnr any
---@param options string[][]
---@return nil
function M.buf_n_map(bufnr, options)
    for _, mapper in ipairs(options) do
        vim.api.nvim_buf_set_keymap(
            bufnr,
            "n",
            mapper[1],
            mapper[2],
            mapper[3] or map_opts
        )
    end
end

---@param options string[][]
---@return nil
function M.v_map(options)
    for _, mapper in ipairs(options) do
        vim.api.nvim_set_keymap(
            "v",
            mapper[1],
            mapper[2],
            mapper[3] or map_opts
        )
    end
end

---@param options string[][]
---@return nil
function M.nv_map(options)
    for _, mapper in ipairs(options) do
        vim.api.nvim_set_keymap(
            "n",
            mapper[1],
            mapper[2],
            mapper[3] or map_opts
        )
        vim.api.nvim_set_keymap(
            "v",
            mapper[1],
            mapper[2],
            mapper[3] or map_opts
        )
    end
end

---@param options string[][]
---@return nil
function M.i_map(options)
    for _, mapper in ipairs(options) do
        vim.api.nvim_set_keymap(
            "i",
            mapper[1],
            mapper[2],
            mapper[3] or map_opts
        )
    end
end

return M
