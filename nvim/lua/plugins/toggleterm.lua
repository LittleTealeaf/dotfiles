return {
	'akinsho/toggleterm.nvim',
	opts = {
		open_mapping = [[<c-\>]],
		direction = 'float',
		float_opts = {
			border = 'curved',
		},
		highlights = {
			FloatBorder = {
				link = 'CatBorder'
			}
		}
	},
	keys = { [[<c-\>]] }
}
