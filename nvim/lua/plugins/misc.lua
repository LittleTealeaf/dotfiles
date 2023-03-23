return {
	{
		'haya14busa/is.vim',
	},
	{
		'jeffkreeftmeijer/vim-numbertoggle',
		event = 'BufEnter'
	},
	{
		'wakatime/vim-wakatime',
		name = 'wakatime',
		event = 'VeryLazy'
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
		opts = {},
		init = function ()
			vim.o.cursorline = true
			vim.o.number = true
			vim.o.termguicolors = true
		end
	}
}
