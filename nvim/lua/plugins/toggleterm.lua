return {
	'akinsho/toggleterm.nvim',
	init = function()
		vim.api.nvim_create_autocmd('TermOpen', {
			desc = 'Set Terminal Keymaps',
			callback = function(a)
				local opts = { buffer = a.buf }
				vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
			end,
			pattern = 'term://*toggleterm#*'
		})
	end,
	config = function(opts)
		local toggleterm = require('toggleterm')
		toggleterm.setup({
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
		})


		vim.keymap.set('v',[[<c-\>]], function()
			toggleterm.send_lines_to_terminal("visual_lines", false, {args = vim.v.count})
		end, {desc = "Send Lines to Terminal"})
	end,
	keys = {
		{ [[<c-\>]], desc = "Toggle Toggleterm" },
	}
}
