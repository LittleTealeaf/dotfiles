require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true
		}
	},
	views = {
		notify = {
			replace = true,
			merge = true,
		},
		messages = {
			view = "popup"
		}
	},
	routes = {},
})
