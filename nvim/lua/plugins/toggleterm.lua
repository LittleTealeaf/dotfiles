return {
	'akinsho/toggleterm.nvim',
	opts = {
		open_mapping = [[<c-\>]],
		direction = 'float',
		float_opts = {
			border = Transparent and 'curved' or 'none',
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
