return {
	{
		'folke/neodev.nvim',
		cond = vim.g.features.lsp,
		dependencies = {
			{ 'hrsh7th/nvim-cmp', name = 'cmp' },
		},
		opts = {
			library = {
				plugins = { 'nvim-dap-ui' },
				types = true
			}
		}
	}
}
