return {
	'luckasRanarison/nvim-devdocs',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope.nvim',
			name = 'telescope'
		},
		'nvim-treesitter/nvim-treesitter'
	},
	opts = {
		previewer_cmd = "glow",
		after_open = function(bufnr)
			vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', ':close<CR>', {})
		end
	},
	keys = {
		{ '<leader>cl', ':DevdocsOpenCurrentFloat<CR>', desc = "Open Current Dev-Docs" }
	},
	event = "VeryLazy"
}
