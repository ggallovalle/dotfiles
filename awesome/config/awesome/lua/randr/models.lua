local inspect = require("inspect")

--- @class deps.Container
--- @field spawn deps.Spawn

--- @class deps.Spawn
local DepsSpawn = {}

--- comment
--- @param command string|string[]|any[]
--- @param callback fun(stdout: string, stderr: string, reason: "exit"|"signal", code: integer)
function DepsSpawn.easy_async(command, callback)
    local cmd = nil
    if type(command) == "string" then
        cmd = command
    else
        cmd = table.concat(command, " ")
    end

    local handle = io.popen(cmd .. " 2>&1")
    -- local handle = io.popen(cmd)
    if handle ~= nil then
        local result = handle:read("*a")
        local _, reason, code = handle:close()
        if code ~= 0 then
            -- print(inspect({ stdout = "", stderr = result, reason = reason, code = code, cmd = command }))
            ---@diagnostic disable-next-line: param-type-mismatch
            callback("", result, reason, code)
        else
            -- print(inspect({ stdout = result, stderr = "", reason = reason, code = code, cmd = command }))
            ---@diagnostic disable-next-line: param-type-mismatch
            callback(result, "", reason, code)
        end
    end
end

--- @class randr.Output
--- @field name string # The name of the output
--- @field private _deps deps.Container
local Output = {}

local P = {
    brigthness_safe_treshold = function(value)
        if type(value) ~= "number" then
            return 1
        end

        if value <= 0.1 then
            return 0.3
        end

        if value >= 1.6 then
            return 1.5
        end

        return value
    end
}
local C = {

}

--- Create a new output
--- @param name string
--- @param deps deps.Container?
--- @return randr.Output
function Output.new(name, deps)
    local obj = { name = name }
    obj.rotate = Output.rotate
    obj.brightness = Output.brightness
    --- @type deps.Container
    local dependencies = {}
    if dependencies.spawn == nil then
        dependencies.spawn = DepsSpawn
    end
    obj._deps = dependencies

    return obj
end

--- This causes the output contents to be rotated in the specified direction
--- @param rotation "normal" | "left" | "rigth" | "inverted"
--- @param callback fun(err: string|nil)
function Output:rotate(rotation, callback)
    self._deps.spawn.easy_async(
        { "xrandr", "--output", self.name, "--rotate", rotation },
        function(_, stderr, _, code)
            if code ~= 0 then
                callback(stderr)
                return
            end

            callback(nil)
        end
    )
end

--- Change the brightness to the specified value
--- @param rate number
--- @param callback fun(err: string|nil, data: number)
function Output:brightness(rate, callback)
    local bright = P.brigthness_safe_treshold(rate)
    self._deps.spawn.easy_async(
        { "xrandr", "--output", self.name, "--brightness", bright },
        function(_, stderr, _, code)
            if code ~= 0 then
                callback(stderr, nil)
                return
            end
            callback(nil, bright)
        end)
end

return {
    Output = Output
}
