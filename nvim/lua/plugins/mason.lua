-- TODO: Go through package list manually and instead create a script to check / use the system installed version
return {
	{
		'williamboman/mason.nvim',
		opts = {},
		cond = vim.g.features.lsp,
	},
}
