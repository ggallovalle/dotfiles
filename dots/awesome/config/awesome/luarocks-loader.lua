local M = {}

--- @class RockTree
--- @field name string # The project tree name, this is only for display purpouses
--- @field root string # The absolute path of where this tree is located
--- @field lua_dir string? # Where lua files are stored in the tree. Default to `tree.root .. cfg.lua_modules_path` and by default `lua_modules_path = "share/lua/" .. cfg.lua_version`.
--- @field lib_dir string? # Where C libraries are stored in the tree. Default to `tree.root .. cfg.lib_modules_path` and by default `lib_modules_path = "lib/lua/" .. cfg.lua_version`.


local has_init = false
local has_setup = false
local final_cfg = nil

local function get_cfg()
    if not has_init then
        local cfg = require("luarocks.core.cfg")
        cfg.init()

        final_cfg = setmetatable({
            init = function()
                return true, nil
            end
        }, {
            __index = cfg,
            __newindex = cfg
        })

        package.loaded["luarocks.core.cfg"] = final_cfg
        has_init = true
    end

    return final_cfg
    -- return require("luarocks.core.cfg")
end

--- Use `RockTree` to luarocks.loader
--- @param tree RockTree
function M.use_rock_tree(tree)
    local cfg = get_cfg()
    table.insert(cfg.rocks_trees, 1, tree)
end

--- Use a folder that has the standard.
--- 1. `/lua` folder where lua files are located.
--- 2. `/lib` folder where lua c files are locakted aka .so files.
---@param tree string
function M.use_folder(tree)
    M.use_rock_tree({
        name = "a path " .. tree,
        root = tree,
        lua_dir = tree .. "/lua",
        lib_dir = tree .. "/lib"
    })
end


function M.compile()
    if has_setup then
        error("Loader has already been setup")
    end
    require("luarocks.loader")
    for modname, _ in pairs(package.loaded) do
        if modname:match("^luarocks%.") then
            package.loaded[modname] = nil
        end
    end
    has_setup = true
end


--- Setupt based on the environment_dir
--- @param environment_dir? string # If not provided it will use the configuration directory
function M.setup(environment_dir)
    local env = environment_dir or require("gears.filesystem").get_configuration_dir()
    M.use_folder(env)
    M.use_rock_tree({
        name = "project",
        root = env .. "/lua_modules"
    })
    M.compile()
end


--- Return a newline separeted string based on a pathlike string like `package.path`
--- or `package.cpath` AKA a string separated by `;`
---@param pathlike any
---@return string
function M.split_path_like(pathlike)
    local path_text = ""
    -- for word in string.gmatch(package.path, '([^;]+)') do
    for word in string.gmatch(pathlike, '([^;]+)') do
        path_text = path_text .. word .. "\n"
    end

    return path_text
end

return M
