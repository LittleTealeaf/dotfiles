return {
	"folke/todo-comments.nvim",
	dependencies = {
		'nvim-lua/plenary.nvim',
		'folke/trouble.nvim',
	},
	lazy = false,
	opts = {},
	keys = {
		{ '<leader>tw', '<cmd>TodoTrouble<CR>', desc = "Open TODOs" }
	}
}
