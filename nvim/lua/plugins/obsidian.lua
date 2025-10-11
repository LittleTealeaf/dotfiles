return {
	"epwalsh/obsidian.nvim",
	cond = true,
	enabled = true,
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
		},
		workspaces = {
			{
				name='aethelspark',
				path='~/Documents/aethelspark'
			}
		}
	}
}
