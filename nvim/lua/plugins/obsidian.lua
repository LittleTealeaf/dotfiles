return {
	"epwalsh/obsidian.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		'hrsh7th/nvim-cmp',
	},
	opts = {
		detect_cwd = true,
		mappings = {
			['gf'] = {
				action = function()
					return require('obsidian').util.gf_passthrough()
				end
			},
		}
	}
}
