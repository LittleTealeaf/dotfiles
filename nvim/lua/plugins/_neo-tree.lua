local neotree = require("neo-tree")
local set_key = vim.keymap.set

neotree.setup({
	close_if_last_window = false,
	follow_current_file = true,
	mappings = {
		["t"] = "",
	}
})

set_key('n','<leader>te',':Neotree position=left toggle<CR>', {silent = true})
set_key('n','<leader>tg', ':Neotree float git_status toggle<CR>', {silent = true})
