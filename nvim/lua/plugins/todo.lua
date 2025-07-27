return {
	"folke/todo-comments.nvim",
	dependencies = {
		'nvim-lua/plenary.nvim',
		'folke/trouble.nvim',
	},
	cond = not vim.g.kitty_scrollback,
	lazy = false,
	event = "VeryLazy",
	opts = {},
	keys = {
		{ '<leader>tw', '<cmd>TodoTrouble<CR>', desc = "Todo" }
	}
}
