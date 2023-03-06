return {
	'folke/noice.nvim',
	dependencies = { 'MunifTanjim/nui.nvim' },
	config = function()
		require('noice').setup({
			lsp = {
				override = {
							['vim.lsp.util.convert_input_to_markdown_lines'] = true,
							['vim.lsp.util.stylize_markdown'] = true,
							['cmp.entry.get_documentation'] = true
				}
			},
			cmdline = {
				view = 'cmdline',
				format = {
					cmdline = {
						icon = ">"
					}
				}
			},
			views = {
				notify = {
					replace = true,
				},
				messages = {
					view = 'popup'
				}
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						kind = "search_count",
					},
					opts = {
						skip = true
					}
				}
			}
		})
	end
}
