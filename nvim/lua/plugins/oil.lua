return {
	'stevearc/oil.nvim',
	dependencies = { 'nvimtree/nvim-web-devicons' },
	opts = {
		keymaps = {
			['<C-v>'] = 'actions.select_vsplit',
			['<C-x>'] = 'actions.select_split',
			['<M-q>'] = 'actions.close',
			['<C-t>'] = false,
			['<C-y>'] = 'actions.copy_entry_path'
		}
	},
	lazy = false,
	config = true,
	keys = {
		{ '<leader>ef', function() require('oil').open() end,       desc = "Open Oil" },
		{ '<leader>eg', function() require('oil').open_float() end, desc = "Open Oil Float" },
	}
}
