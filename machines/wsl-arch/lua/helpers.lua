local path = require("chuaz.path")
local M = {}

function M.entry_config_dir(program, attributes, opts)
    opts = opts or {}
    if opts.config_dir == nil then
        opts.config_dir = program
    end

    local entry = {
        type = "directory",
        --- source = { program, "config", opts.config_dir },
        source = path.join(program, "config", opts.config_dir),
        target = { ".config", opts.config_dir }
    }
    if type(attributes) == "table" then
        entry.attributes = attributes
    end

    return entry
end

function M.entry_config_file(program, file, attributes, opts)
    opts = opts or {}
    if opts.config_dir == nil then
        opts.config_dir = program
    end

    local entry = {
        type = "file",
        source = { program, "config", opts.config_dir, file },
        target = { ".config", opts.config_dir, file }
    }
    if type(attributes) == "table" then
        entry.attributes = attributes
    end

    return entry
end

return M
