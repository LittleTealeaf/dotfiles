return {
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
			},
			integration = {
				lualine = {
					enabled = false
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
