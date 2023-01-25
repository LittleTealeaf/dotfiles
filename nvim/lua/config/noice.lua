require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true
		}
	},
	cmdline = {
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
			view = "popup"
		},
	},
	routes = {},
	presets = {
		command_palette = true
	}
})
