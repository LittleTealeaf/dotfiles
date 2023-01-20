local notify = require('notify')

notify.setup({
	background_colour = "#00000000",
	stages = "fade"
})

vim.notify = notify
