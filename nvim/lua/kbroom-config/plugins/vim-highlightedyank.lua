local opts = require("kbroom-config.options")

return {
	"machakann/vim-highlightedyank",
	config = function()
		opts.global({ highlightedyank_whighlight_duration = 100 })
	end,
}
