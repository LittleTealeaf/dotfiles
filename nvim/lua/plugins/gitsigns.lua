return {
	'lewis6991/gitsigns.nvim',
	event = 'VeryLazy',
	config = true,
	lazy = false,
	cond = vim.g.features.git,
	keys = {
		{ '<leader>gb', '<CMD>Gitsigns blame_line<CR>', desc = "Git Blame" }
	}
}
