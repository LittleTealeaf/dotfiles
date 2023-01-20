local notify = require('notify')

notify.setup({
	timeout = 100,
	background_colour = "#00000000",
	stages = "fade",
	fps=60,
	max_width = 100,
})

vim.notify = notify
