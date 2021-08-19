local global = require("kbroom-config.options").global

return {
    "machakann/vim-highlightedyank",
    config = function() global {highlightedyank_whighlight_duration = 100} end
}
