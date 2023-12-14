return {
	'quarto-dev/quarto-nvim',
	dependencies = {
		'jmbuhr/otter.nvim',
		'hrsh7th/nvim-cmp',
		'neovim/nvim-lspconfig',
		'nvim-treesitter/nvim-treesitter'
	},
	cond = function()
		local status, _ = os.execute("which quarto &> /dev/null")
		return status == 0
	end,
	ft = { "quarto" },
	opts = {
		codeRunner = {
		}
	}
}
