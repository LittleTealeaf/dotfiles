return {
	{
		'folke/neodev.nvim',
		dependencies = {
			{'hrsh7th/nvim-cmp', name = 'cmp'},
		},
		opts = {
			library = {
				plugins = { 'nvim-dap-ui' },
				types = true
			}
		}
	}
}
