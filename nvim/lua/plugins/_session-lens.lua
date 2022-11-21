require('session-lens').setup({
	path_display = {'shorten'},
	previewer = true
})

require("telescope").load_extension("session-lens")

