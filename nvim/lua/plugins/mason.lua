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
		event = 'VeryLazy',
		dependencies = { 'williamboman/mason.nvim', 'mfussenegger/nvim-dap' },
		config = function ()
			require('mason-nvim-dap').setup({
				ensure_installed = {'debugpy'},
				handlers = {},
			})
		end
	}
}
