return {
	"folke/todo-comments.nvim",
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	lazy = false,
	opts = {},
	keys = {
		{'<leader>ct', '<cmd>TodoTrouble<CR>', desc = "Open TODOs"}
	}
}
