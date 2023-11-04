return {
	'akinsho/flutter-tools.nvim',
	dependencies = {
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
