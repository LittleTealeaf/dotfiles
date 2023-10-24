-- TODO: This needs to be revamped with new outlines

local routes = {
	-- Hide all search related messages
	{
		filter = {
			['any'] = {
				{
					event = "msg_show",
					kind = "search_count"
				},
				{
					kind = "wmsg",
					event = "msg_show",
					['any'] = {
						{
							find = 'search hit '
						},
						{
							find = "continuing at "
						}
					}
				}
			}
		},
		opts = {
			skip = true,
		}
	},
	-- Written Messages
	{
		filter = {
			event = 'msg_show',
			kind = '',
			find = 'written'
		},
		view = 'mini'
	},
	-- Errors in mini
	{
		filter = {
			kind = 'emsg'
		},
		view = 'mini'
	}
}

return {
	{
		'rcarriga/nvim-notify',
		dependnecies = {
			'MunifTanjim/nui.nvim',
		},
		opts = {
			timeout = 500,
			-- background_colour = '#000000',
			stages = 'slide',
			fps = 60,
			render = 'compact'
		},
	},
	{
		'folke/noice.nvim',
		dependencies = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify'
		},
		lazy = false,
		opts = {
			commands = {
				history = {
					view = "popup"
				},
				errors = {
					view = "popup"
				}
			},
			presets = {
				lsp_doc_border = Transparent,
				inc_rename = true,
			},
			messages = {
				view_search = false,
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
			cmdline = {
				view = 'cmdline',
				format = {
					cmdline = {
						icon = ">"
					}
				}
			},
			views = {
				nofity = {
					replace = true
				},
				messages = {
					view = 'popup'
				},
				mini = {
					win_options = {
						winblend = 0
					}
				}
			},
			routes = routes,
			notify = {
				enabled = true,
				view = "notify"
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
	},
}
