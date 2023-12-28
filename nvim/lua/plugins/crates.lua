return {
	"saecki/crates.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvimtools/none-ls.nvim" }
	},
	opts = {
		null_ls = {
			enabled = true,
			name = "crates.nvim"
		}
	}
}
