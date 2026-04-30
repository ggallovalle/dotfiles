local helpers = require("helpers")
local logger = require("chuaz.logger")
local chuaz = require("chuaz")
--- local serde = require("chuaz.serde")

--- local data_value, err = serde.yaml.serialize(chuaz.data)
--- logger:info("chuaz.data", { dataa = data_value, err = err, format = "yaml" })

logger:info("chuaz.version is " .. chuaz.version.message)

return {
    entries = {
        helpers.entry_config_dir("mise"),
        helpers.entry_config_dir("starship"),
        helpers.entry_config_file("git", "config", { "template" }),
    }
}
