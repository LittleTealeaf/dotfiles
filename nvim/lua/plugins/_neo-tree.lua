local neotree = require("neo-tree")
local set_key = vim.keymap.set

neotree.setup({
	close_if_last_window = true,
	follow_current_file = true,
	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = false,
		}
	},
	mappings = {
		["t"] = "",
	}
})

set_key('n','<leader>tt',':NeoTreeShowToggle<CR>',{silent=true})
set_key('n','<leader>te',':Neotree position=left <CR>', {silent = true})
set_key('n','<leader>th',':NeoTreeClose<CR>', {silent=true})
set_key('n','<leader>tg', ':Neotree float git_status toggle<CR>', {silent = true})
