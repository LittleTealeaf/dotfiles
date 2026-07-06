vim.pack.add({ Github('stevearc/oil.nvim') })
local oil = require('oil')

oil.setup({
	view_options = {
		show_hidden = true
	},
	confirmation = {
		border = Transparent and "rounded" or nil
	},
	float = {
		border = "rounded",
		preview_split = 'right',
		padding = 3,
	},
	keymaps = {
		['<esc>'] = 'actions.close',
		['<M-q>'] = 'actions.close',
		['<C-v>'] = 'actions.select_vsplit',
		['<C-x>'] = 'actions.select_split',
		['<C-t>'] = 'actions.open_cmdline',
		['<C-y>'] = 'actions.copy_entry_path',
		['<C-l>'] = 'actions.send_to_loclist',
		['<C-r>'] = 'actions.refresh',
		['<C-u>'] = 'actions.preview_scroll_up',
		['<C-d>'] = 'actions.preview_scroll_down'
	}
})


vim.keymap.set(
	'n',
	'<leader>ew',
	function()
		oil.open_float(vim.uv.cwd(), { preview = { horizontal = true } })
	end,
	{ desc = "Open Workspace in Oil" }
)

vim.keymap.set(
	'n',
	'<leader>eq',
	function()
		oil.open(vim.uv.cwd(), {})
	end,
	{ desc = "Open Workspace in Oil" }
)

vim.keymap.set(
	'n',
	'<leader>er',
	function()
		oil.open_float(nil, { preview = { horizontal = true } })
	end,
	{ desc = 'Open File Location in Oil' }
)

vim.keymap.set(
	'n',
	'<leader>ef',
	function()
		oil.open(nil, {})
	end,
	{ desc = 'Open File Location in Oil' }
)
