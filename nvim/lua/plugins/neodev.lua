return {
	{
		'folke/neodev.nvim',
		dependencies = {
			{ 'hrsh7th/nvim-cmp' },
		},
		cond = vim.g.features.lsp,
		opts = {
			library = {
				plugins = { 'nvim-dap-ui' },
				types = true
			}
		}
	}
}
