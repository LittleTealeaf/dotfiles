return {
	'quarto-dev/quarto-nvim',
	enable = false,
	dependencies = {
		'jmbuhr/otter.nvim',
		'hrsh7th/nvim-cmp',
		'neovim/nvim-lspconfig',
		'nvim-treesitter/nvim-treesitter'
	},
	lazy = true,
	cond = function()
		local status, _ = os.execute("which quarto &> /dev/null")
		return status == 0 and vim.g.features.lsp
	end,
	ft = { "quarto" },
	opts = {
		codeRunner = {
		}
	}
}
