local remaps = require("kbroom-config.remaps")
local options = require("kbroom-config.options")
local plugins = require("kbroom-config.packer")

plugins()
options.main()
remaps.main()
