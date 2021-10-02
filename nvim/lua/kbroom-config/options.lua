local M = {}

-- Set global options.
-- Example
-- ```
-- global { key = "value", ["key-2"] = "value2" }
-- ```
---@param options table
---@return nil
function M.global(options)
    for key, value in pairs(options) do
        vim.api.nvim_set_option(key, value)
    end
end

-- Set buffer options.
-- Example
-- ```
-- buffer(1,  { key = "value", ["key-2"] = "value2" })
-- buffer(bufnr,  { key = "value", ["key-2"] = "value2" })
-- ```
---@param bufnr any
---@param options table
---@return nil
function M.buffer(bufnr, options)
    for key, value in pairs(options) do
        vim.api.nvim_buf_set_option(bufnr, key, value)
    end
end

-- Set window options.
-- Example
-- ```
-- window(1,  { key = "value", ["key-2"] = "value2" })
-- window(bufnr,  { key = "value", ["key-2"] = "value2" })
-- ```
---@param windownr any
---@param options table
---@return nil
function M.window(windownr, options)
    for key, value in pairs(options) do
        -- vo[key] = value
        vim.wo[key] = value
    end
end

---@return nil
local function main() end

return M
