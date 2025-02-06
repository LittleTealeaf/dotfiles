return {
	{
		'folke/which-key.nvim',
		dependencies = {
			{ 'echasnovski/mini.icons', version = false }
		},
		event = 'VeryLazy',
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {
			preset = "helix",
			delay = 500,
			plugins = {
				marks = true,
				spelling = {
					enabled = true
				}
			},
			win = {
				border = 'none',
			},
			notify = false
		},
		config = function(_, opts)
			local wk = require('which-key')
			wk.setup(opts)
			wk.add({
				{ "<leader>b", group = "Buffers", icon = "" },
				{ "<leader>c", group = "Code" },
				{ "<leader>d", group = "Debugger" },
				{ "<leader>e", group = "File Manager", icon = "" },
				{ "<leader>f", group = "Search" },
				{ "<leader>g", group = "GitHub" },
				{ "<leader>n", group = "Noice" },
				{ "<leader>s", group = "Symbols" },
				{ "<leader>t", group = "Trouble", icon = "" },
				{ "<leader>w", group = "Windows", icon = "" }
			})
		end
	}
}
