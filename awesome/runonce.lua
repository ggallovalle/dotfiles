-- @author Peter J. Kranz (Absurd-Mind, peter@myref.net)
-- Any questions, criticism or praise just drop me an email
local awful = require("awful")
local io = io
local os = os

_ENV = nil
local M = {}

-- get the current Pid of awesome
local function get_current_pid()
    -- get awesome pid from pgrep
    local fpid = io.popen("pgrep -u " .. os.getenv("USER") .. " -o awesome")
    local pid = fpid:read("*n")
    fpid:close()

    -- sanity check
    if pid == nil then
        return -1
    end

    return pid
end

local function get_old_pid(filename)
    -- open file
    local pidFile = io.open(filename)
    if pidFile == nil then
        return -1
    end

    -- read number
    local pid = pidFile:read("*n")
    pidFile:close()

    -- sanity check
    if pid <= 0 then
        return -1
    end

    return pid;
end

local function write_pid(filename, pid)
    local pidFile = io.open(filename, "w+")
    pidFile:write(pid)
    pidFile:close()
end

local function shallExecute(oldPid, newPid)
    -- simple check if equivalent
    if oldPid == newPid then
        return false
    end

    return true
end

local function get_pid_file()
    local host = io.lines("/proc/sys/kernel/hostname")()
    return awful.util.getdir("cache") .. "/awesome." .. host .. ".pid"
end

-- run Once per real awesome start (config reload works)
-- does not cover "pkill awesome && awesome"
function M.run(shellCommand)
    -- check and Execute
    if shallExecute(M.old_pid, M.current_pid) then
        awful.util.spawn_with_shell(shellCommand)
    end
end

M.pid_file = get_pid_file()
M.old_pid = get_old_pid(M.pid_file)
M.current_pid = get_current_pid()
write_pid(M.pid_file, M.current_pid)

return M
