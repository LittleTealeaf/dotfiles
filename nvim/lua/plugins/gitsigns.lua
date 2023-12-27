return {
	'lewis6991/gitsigns.nvim',
	event = 'VeryLazy',
	config = true,
	lazy = false,
	keys = {
		{ '<leader>gb', '<CMD>Gitsigns blame_line<CR>', desc = "Git Blame" }
	}
}
