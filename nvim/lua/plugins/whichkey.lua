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
					name = 'Buffers'
				},
				c = {
					name = 'Code',
					f = { 'Format' },
					a = { 'Code Actions' },
					d = { 'Definition' },
					e = { 'Diagnostics' },
					D = { 'Declaration' },
					i = { 'Implementation' }
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
				w = {
					name = 'Write Files',
					w = {
						name = 'Write File'
					},
					a = {
						name = 'Write All Files'
					}
				},
				s = {
					name = 'Symbols'
				}
			}, { prefix = '<leader>' })
		end
	}
}
