return {
	{
		"SmiteshP/nvim-navic",
		cond = vim.g.features.lsp,
		opts = {
			highlight = true,
			lsp = {
				auto_attach = true,
			}
		}
	},
}
