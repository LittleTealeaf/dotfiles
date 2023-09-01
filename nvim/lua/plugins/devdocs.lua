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
	opts = {},
	keys = {
		{ '<leader>cl', ':DevdocsOpenCurrent<CR>', desc = "Open Current Dev-Docs" }
	}
}
