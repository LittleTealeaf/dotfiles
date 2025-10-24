local LSP_SERVERS = {
	"ts_ls",
	"lua_ls",
	"codelldb",
	"clangd"
}


return {
	'mason-org/mason-lspconfig.nvim',
	dependencies = {
		{ 'mason-org/mason.nvim', opts = {} },
		'neovim/nvim-lspconfig'
	},
	cond = vim.g.features.lsp,
	config = function()
		for _, lsp in ipairs(LSP_SERVERS) do
			vim.lsp.enable(lsp)
		end


		require('mason-lspconfig').setup({
			automatic_enable = {
				exclude = {
					'rust_analyzer'
				}
			}
		})
	end,
}
