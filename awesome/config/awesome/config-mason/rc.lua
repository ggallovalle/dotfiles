
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- [ always first
require("config-mason.error-handling")
require("config-mason.variables")
-- ]

require("config-mason.layouts")
require("config-mason.mappings")
require("config-mason.mouse")
require("config-mason.screen")
require("config-mason.signals")
require("config-mason.autostart")

-- require("runtime")
