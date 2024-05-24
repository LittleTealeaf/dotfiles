return {
	'akinsho/flutter-tools.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope.nvim',
	},
	ft = 'dart',
	opts = {
		lsp = {
			on_attach = function(_, _) end
		}
	},
	config = true,
	enabled = true,
}
