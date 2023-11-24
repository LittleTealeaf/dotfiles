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
		{ '<leader>e', function() require('oil').open_float() end, desc = "Open Float" }
	}
}
