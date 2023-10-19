return {
	'akinsho/flutter-tools.nvim',
	requires = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope.nvim',
			name = 'telescope',
		}
	},
	ft = 'dart',
	opts = {
		lsp = {
			on_attach = function(_, bufnr) end
		}
	},
	config = true
}
