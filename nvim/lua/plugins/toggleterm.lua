return {
	'akinsho/toggleterm.nvim',
	init = function()
		vim.api.nvim_create_autocmd('TermOpen', {
			desc = 'Set Terminal Keymaps',
			callback = function()
				local opts = { buffer = 0 }
				vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
			end,
			pattern = 'term://*toggleterm#*'
		})
	end,
	opts = {
		open_mapping = [[<c-\>]],
		size = 20,
		direction = 'horizontal',
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
