return {
	{
		'folke/neodev.nvim',
		dependencies = {
			{ 'hrsh7th/nvim-cmp' },
		},
		event = "InsertEnter",
		cond = vim.g.features.lsp,
		opts = {
			override = function(root_dir, _)
				return root_dir == os.getenv('DOT_FILES') .. '/nvim'
			end,
			lspconfig = false
		}
	}
}
