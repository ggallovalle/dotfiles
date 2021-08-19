---@diagnostic disable-next-line: undefined-global
local vim = vim

---@param options table
---@return nil
local function buffer(options)
    for key, value in pairs(options) do
        vim.o[key] = value
        vim.bo[key] = value
    end
end


---@param options table
---@return nil
local function global(options)
    for key, value in pairs(options) do
        vim.g[key] = value
    end
end

---@param options table
---@return nil
local function window(options)
    for key, value in pairs(options) do
        -- vo[key] = value
        vim.wo[key] = value
    end
end

---@return nil
local function main()
    buffer {
        -- use tabs instead of spaces with a default value of 2
        tabstop = 2,
        shiftwidth = 2,
        expandtab = false
    }

    window {
        -- left hand side number
        number = true,
        relativenumber = true,
        signcolumn = "number",
        -- wrap lines
        wrap = true
    }

    -- leader key as space
    vim.g.mapleader = " "
    vim.b.mapleader = " "
end

return {
    main = main,
    window = window,
    buffer = buffer,
    global = global
}
