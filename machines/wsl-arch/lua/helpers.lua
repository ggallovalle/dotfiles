local M = {}

function M.entry_config_dir(program, config_dir)
    if config_dir == nil then
        config_dir = program
    end

    return {
        type = "directory",
        source = { program, "config", config_dir },
        target = { ".config", config_dir }
    }
end

return M
