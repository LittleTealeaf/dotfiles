return {
	{
		'williamboman/mason.nvim',
		opts = {
			ui = {
			}
		}
	},
	{
		'jay-babu/mason-nvim-dap.nvim',
		dependencies = { 'williamboman/mason.nvim' },
		config = true
	}
}
