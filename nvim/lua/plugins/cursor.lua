return {
	{
		'sitiom/nvim-numbertoggle',
		event = 'BufEnter'
	},
	{
		'lewis6991/gitsigns.nvim',
		event = 'VeryLazy',
		config = true
	},
	{
		"mawkler/modicator.nvim",
		dependencies = {
			"catppuccin/nvim",
			name = "catppuccin",
		},
		opts = {
			show_warnings = false,
			highlights = {
				defaults = {
					bold = true,
				}
			}
		},
		init = function()
			vim.o.cursorline = true
			vim.o.number = true
			vim.o.termguicolors = true
		end,
		event = "VeryLazy"
	}
}
