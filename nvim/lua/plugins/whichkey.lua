return {
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {
			plugins = {
				marks = false,
				spelling = {
					enabled = true
				}
			},
			window = {
				border = 'none',
				winblend = 10
			},
			notify = false
		},
		config = function(_, opts)
			local wk = require('which-key')
			wk.setup(opts)
			wk.register({
				{ "<leader>b", group = "Buffers" },
				{ "<leader>c", group = "Code" },
				{ "<leader>d", group = "Debugger" },
				{ "<leader>e", group = "Oil" },
				{ "<leader>f", group = "Files" },
				{ "<leader>g", group = "GitHub" },
				{ "<leader>n", group = "Noice" },
				{ "<leader>s", group = "Symbols" },
				{ "<leader>t", group = "Trouble" },
			})
		end
	}
}
