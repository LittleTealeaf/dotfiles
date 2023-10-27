return {
	{
		'folke/noice.nvim',
		dependencies = {
			'MunifTanjim/nui.nvim'
		},
		lazy = false,
		opts = {
			cmdline = {
				view = 'cmdline',
				format = {
					cmdline = {
						icon = ">"
					}
				}
			},
			lsp = {
				progress = {
					view = 'mini',
				},
				override = {
					['vim.lsp.util.convert_input_to_markdown_lines'] = true,
					['vim.lsp.util.stylize_markdown'] = true,
					['cmp.entry.get_documentation'] = true,
				},
				messages = {
					enabled = true,
					view = 'mini'
				},
				hover = {
					silent = true,
				}
			},
			presets = {
				lsp_doc_border = Transparent,
				inc_rename = true
			},
			commands = {
				history = {
					view = "popup"
				},
				errors = {
					view = "popup"
				}
			},
			messages = {
				view_search = false,
			},
		},
		keys = {
			{ '<leader>nl', '<cmd>Noice last<CR>',    desc = "Open Last Notification" },
			{ '<leader>nm', '<cmd>messages<CR>',      desc = "Open Messages" },
			{ '<leader>nc', '<cmd>Noice dismiss<CR>', desc = "Clear Messages" },
			{ '<leader>nn', '<cmd>Noice<CR>',         desc = "Noice History" },
			{ '<leader>ne', '<cmd>Noice errors<CR>',  desc = "Noice Errors" },
			{
				'<S-Enter>',
				function() require('noice').redirect(vim.fn.getcmdline()) end,
				desc = "Redirect Cmdline",
				mode = 'c'
			}
		}
	}
}
