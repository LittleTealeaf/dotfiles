return {
	{
		'haya14busa/is.vim',
		event = "BufEnter"
	},
	{
		'wakatime/vim-wakatime',
		name = 'wakatime',
		event = 'VeryLazy'
	},
	{
		'jghauser/mkdir.nvim',
		event = 'BufEnter'
	},
	{
		'famiu/bufdelete.nvim',
		keys = {
			{ '<leader>bd', '<cmd>Bdelete<CR>', desc = "Delete Buffer" }
		}
	}
}
