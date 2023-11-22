return {
	{
		'williamboman/mason.nvim',
		cond = vim.g.features.lsp,
		opts = {
			ui = {
			}
		}
	},
	{
		'jay-babu/mason-nvim-dap.nvim',
		cond = vim.g.features.lsp and vim.g.features.dap,
		dependencies = { 'williamboman/mason.nvim' },
		config = true
	}
}
