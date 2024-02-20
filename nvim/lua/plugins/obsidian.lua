return {
	"epwalsh/obsidian.nvim",
	cond = false,
	enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		'hrsh7th/nvim-cmp',
	},
	event = "InsertEnter",
	opts = {
		mappings = {
			['gf'] = {
				action = function()
					return require('obsidian').util.gf_passthrough()
				end
			},
		}
	}
}
