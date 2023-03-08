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
		lazy = true,
		event = 'BufEnter',
		config = true
	}
}
