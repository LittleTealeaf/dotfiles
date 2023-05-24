local routes = {
	-- Hide all searches
	{
		filter = {
			event = "msg_show",
			kind = "search_count",
		},
		opts = {
			skip = true
		}
	},
	-- Redirect written messages to mini
	{
		filter = {
			event = 'msg_show',
			kind = '',
			find = 'written'
		},
		view = 'mini'
	},
	-- Skip search hit BOTTOM messages
	{
		filter = {
			event = 'msg_show',
			kind = 'wmsg',
			find = 'search hit BOTTOM'
		},
		opts = {
			skip = true
		}
	},
	{
		filter = {
			event = 'msg_show',
			kind = 'wmsg',
			find = 'search hit TOP'
		},
		opts = {
			skip = true
		}
	},
	-- Send errors to mini
	{
		filter = {
			event = 'msg_show',
			kind = 'emsg',
		},
		view = 'mini'
	},
	-- Filter out "No Information Available"
	{
		filter = {
			find = 'No information available'
		},
		opts = {
			skip = true,
		}
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
			background_colour = '#000000',
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
			presets = {
				lsp_doc_border = true,
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
					['cmp.entry.get_documentation'] = false,
				},
				messages = {
					enabled = true,
					view = 'mini'
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
			}
		},
		keys = {
			{ '<leader>nl', '<cmd>Noice last<CR>',    desc = "Open Last Notification" },
			{ '<leader>nm', '<cmd>messages<CR>',      desc = "Open Messages" },
			{ '<leader>nc', '<cmd>Noice dismiss<CR>', desc = "Clear Messages" },
			{ '<leader>nn', '<cmd>Noice trouble<CR>', desc = "Open Noice in Trouble" }
		}
	},
}
