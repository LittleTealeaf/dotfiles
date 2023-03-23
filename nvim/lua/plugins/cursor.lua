return {
	{
		'sitiom/nvim-numbertoggle',
		event = 'BufEnter'
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
		opts = function()
			local function get_fg(highlight)
				return {
					foreground = require('modicator').get_highlight_fg(highlight)
				}
			end

			return {
				highlights = {
					modes = {
						['n'] = get_fg("lualine_b_normal"),
						['i'] = get_fg("lualine_b_insert"),
						['v'] = get_fg("lualine_b_visual"),
						['V'] = get_fg("lualine_b_visual"),
						['�'] = get_fg("lualine_b_visual"),
						['R'] = get_fg("lualine_b_replace"),
						["c"] = get_fg("lualine_b_command"),
					}
				}
			}
		end,
		init = function()
			vim.o.cursorline = true
			vim.o.number = true
			vim.o.termguicolors = true
		end,
		event = "VeryLazy"
	}
}
