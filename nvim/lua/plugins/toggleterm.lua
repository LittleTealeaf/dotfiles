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
				link = "ToggleTermNormal"
			},
			NormalFloat = {
				link = 'ToggleTermNormal'
			},
			FloatBorder = {
				link = 'ToggleTermBorder'
			}
		}
	},
	keys = {
		{ [[<c-\>]], desc = "Toggle Toggleterm" },
	}
}
