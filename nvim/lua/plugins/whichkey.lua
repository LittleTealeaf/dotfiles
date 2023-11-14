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
				spelling = {
					enabled = true
				}
			},
			window = {
				border = 'rounded'
			}
		},
		config = function(_, opts)
			local wk = require('which-key')
			wk.setup(opts)
			wk.register({
				f = {
					name = 'Files'
				},
				b = {
					name = 'Buffers',
					w = "Quit",
					s = "Split",
					v = "Vertical Split"
				},
				c = {
					name = 'Code',
				},
				t = {
					name = 'Trouble'
				},
				g = {
					name = 'GitHub'
				},
				n = {
					name = 'Noice'
				},
				d = {
					name = 'Debugger'
				},
				e = {
					name = 'NeoTree'
				},
				s = {
					name = 'Symbols'
				}
			}, { prefix = '<leader>' })
		end
	}
}
