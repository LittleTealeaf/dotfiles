return {
	'stevearc/oil.nvim',
	dependencies = { 'nvimtree/nvim-web-devicons' },
	opts = {
		keymaps = {
			['<C-v>'] = 'actions.select_vsplit',
			['<C-x>'] = 'actions.select_split',
			['<M-q>'] = 'actions.close'
		}
	},
	lazy = false,
	config = true,
	keys = {
		{ '<leader>ef', function() require('oil').open() end, desc = "Open Oil" },
		{ '<leader>eg', function() require('oil').open_float() end, desc = "Open Oil Float" },
		-- { '<leader>eb', function() require('oil').open() end, desc = "Open Oil" }
	}
}
