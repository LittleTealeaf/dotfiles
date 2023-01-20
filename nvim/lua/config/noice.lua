require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true
		}
	},
	cmdline = {
		view = "cmdline"
	},
	views = {
		notify = {
			replace = true,
			merge = true,
		},
		messages = {
			view = "popup"
		},
		popupmenu = {
			win_options = {
				cursorline = true,
				cursorlineopt = "line",
				winhighlight = {
					Normal = "FloatNormal",
					FloatBorder = "TelescopeBorder",
				}
			}
		},
		popup = {
			win_options = {
				winhighlight = {
					Normal = "Normal",
					FloatBorder = "TelescopeBorder",
				}
			}
		},
		cmdline = {
			win_options = {
				winhighlight = {
					Normal = "Normal",
					IncSearch = "",
					Search = ""
				}
			}
		},
	},
	routes = {},
})
