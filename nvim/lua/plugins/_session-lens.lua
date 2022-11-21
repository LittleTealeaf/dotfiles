local session_lens = require('session-lens')

session_lens.setup({
	path_display = {'shorten'},
	previewer = true
})

require("telescope").load_extension("session-lens")

vim.keymap.set("n","<leader>fs",session_lens.search_session, {})

