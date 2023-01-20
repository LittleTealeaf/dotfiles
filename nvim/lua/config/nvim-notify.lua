local notify = require('notify')

notify.setup({
	timeout = 100,
	background_colour = "#00000000",
	stages = "fade"
})

vim.notify = notify
