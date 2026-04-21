--- @meta

--- @class awesome.Awesome : awesome.Signals
--- See:
--- [luaL_Reg](https://github.com/awesomeWM/awesome/blob/9b1246af3da71910e84cd446e1b973b384ce0fac/luaa.c#L1091)
--- | [Docs](https://awesomewm.org/doc/api/libraries/awesome.html)
local awesome = {}

--- @type string
--- The version of awesome.
awesome.version = nil

--- @type string
--- The release name of awesome.
awesome.release = nil

--- @type string
--- The configuration file which has been loaded.
awesome.conffile = nil

--- @type boolean
--- True if we are still in startup, false otherwise.
awesome.startup = nil

--- @type string
--- Error message for errors that occured during startup.
awesome.startup_errors = nil

--- @type boolean
--- Tue if the composite manager is running, false otherwise.
awesome.composite_manager_running = nil

--- @type table
--- Table mapping between signal numbers and signal identifiers.
awesome.unix_signal = nil

--- @type string
--- The hostname of the computer on which we are running.
awesome.hostname = nil


--- @type string
--- The path where themes were installed to.
awesome.themes_path = nil

--- @type string
--- The path where icons were installed to.
awesome.icon_path = nil


--- Register a new X property.
---
--- See:
--- [Docs](https://awesomewm.org/doc/api/libraries/awesome.html#register_xproperty)
--- @param name string
--- @param type "string" | "number" | "boolean"
function awesome.register_xproperty(name, type) end


--- Quit awesome
---
--- See:
--- [Docs](https://awesomewm.org/doc/api/libraries/awesome.html#quit)
--- @param code number? # Default 0. The exit code to use when exiting.
function awesome.quit(code) end


--- Execute another application, probably a window manager, to replace awesome.
---
--- See:
--- [Docs](https://awesomewm.org/doc/api/libraries/awesome.html#exec)
--- @param cmd string # The command line to execute
function awesome.exec(cmd) end


--- Restart awesome.
---
--- See:
--- [Docs](https://awesomewm.org/doc/api/libraries/awesome.html#restart)
--- | [Source](https://github.com/awesomeWM/awesome/blob/9b1246af3da71910e84cd446e1b973b384ce0fac/luaa.c#L269)
function awesome.restart() end


--- Send a signal to a process.
---
--- See:
--- [Docs](https://awesomewm.org/doc/api/libraries/awesome.html#kill)
--- @param pid number # Process identifier.
--- @param sig number # Signal number.
--- @return boolean
function awesome.kill(pid, sig) end


--- Synchronize with the X11 server. This is needed in the test suite to avoid
--- some race conditions. You should never need to use this function.
---
--- See:
--- [Docs](https://awesomewm.org/doc/api/libraries/awesome.html#sync)
function awesome.sync() end


--- Translate a GdkPixbuf to a cairo image surface.
---
--- See:
--- [Docs](https://awesomewm.org/doc/api/libraries/awesome.html#pixbuf_to_surface)
--- @param pixbuf any # The pixbuf as a light user datum
--- @param path any # The pixbuf origin path
function awesome.pixbuf_to_surface(pixbuf, path) end


--- Load an image from a given path.
---
--- See:
--- [Docs](https://awesomewm.org/doc/api/libraries/awesome.html#load_image)
--- @param name string # The file name
--- @return any # A cairo surface as a light user datum.
function awesome.load_image(name) end


--- Set the preferred size for client icons.
---
--- See:
--- [Docs](https://awesomewm.org/doc/api/libraries/awesome.html#set_preferred_icon_size)
--- @param size number # The size in pixels
function awesome.set_preferred_icon_size(size) end


--- Switch keyboard layout.
---
--- See:
--- [Docs](https://awesomewm.org/doc/api/libraries/awesome.html#xkb_set_layout_group)
--- @param num number # Keyboard layout number
function awesome.xkb_set_layout_group(num) end


--- Get keyboard layout.
---
--- See:
--- [Docs](https://awesomewm.org/doc/api/libraries/awesome.html#xkb_get_layout_group)
function awesome.xkb_get_layout_group() end


--- Get layout short names.
---
--- See:
--- [Docs](https://awesomewm.org/doc/api/libraries/awesome.html#xkb_get_group_names)
--- @return string # A string describing the current layout settings (`pc+us+de:2+inet(evdev)`)
function awesome.xkb_get_group_names(num) end
