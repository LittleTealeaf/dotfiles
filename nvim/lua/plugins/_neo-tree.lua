local neotree = require("neo-tree")
local set_key = vim.keymap.set

neotree.setup({
	close_if_last_window = false,
	follow_current_file = true,
	mappings = {
		["t"] = "",
	}
})

set_key('n','<leader>fd',':Neotree<CR>', {silent = true})

