local notify = require('notify')

notify.setup({
	timeout = 500,
	background_colour = "#00000000",
	stages = "fade",
	fps=60,
	max_width = 75,
})

vim.notify = notify
