return {
	"luckasRanarison/nvim-devdocs",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope.nvim", name = "telescope" },
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		wrap = true,
		after_open = function(bufnr)
			vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', ':close<CR>', {})
		end
	},
	lazy = false,
	keys = {
		{ '<leader>hf', '<CMD>DevdocsOpenCurrentFloat<CR>', desc = "Dev Docs Open Current Float" },
		{ '<leader>hd', '<CMD>DevdocsOpenCurrent<CR>',      desc = "Dev Docs Open Current" },
		{ '<leader>ha', '<CMD>DevdocsOpen<CR>',             desc = "Dev Docs Open" },
		{ '<leader>hs', '<CMD>DevdocsOpenFloat<CR>',        desc = "Dev Docs Open Float" }
	}
}
