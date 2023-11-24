return {
	'stevearc/oil.nvim',
	dependencies = { 'nvimtree/nvim-web-devicons' },
	opts = {
		keymaps = {
			['<M-q>'] = 'actions.close'
		}
	},
	config = true,
	keys = {
		{ '<leader>ef', function() require('oil').open_float() end, desc = "Open Oil Float" },
		{ '<leader>eb', function() require('oil').open() end, desc = "Open Oil" }
	}
}
