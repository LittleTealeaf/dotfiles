return {
	{
		'folke/neodev.nvim',
		dependencies = {
			{ 'hrsh7th/nvim-cmp' },
		},
		event = "InsertEnter",
		cond = vim.g.features.lsp,
		opts = {
			library = {
				plugins = { 'nvim-dap-ui' },
				types = true
			}
		}
	}
}
