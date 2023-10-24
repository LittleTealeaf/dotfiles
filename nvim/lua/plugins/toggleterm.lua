return {
	'akinsho/toggleterm.nvim',
	opts = {
		open_mapping = [[<c-\>]],
		direction = 'float',
		float_opts = {
			border = 'curved',
		},
		highlights = {
			Normal = {
				link = "Normal"
			},
			FloatBorder = {
				link = 'FloatBorder'
			}
		}
	},
	keys = {
		{ [[<c-\>]], desc = "Toggle Toggleterm" },
	}
}
