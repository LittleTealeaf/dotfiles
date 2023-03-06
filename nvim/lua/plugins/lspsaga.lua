return {
	'glepnir/lspsaga.nvim',
	dependencies = {
		{ "catppuccin/nvim", name = 'catppuccin' },
		'neovim/nvim-lspconfig',
	},
	event = 'BufRead',
	config = function()
		local catppuccin_theme = require('catppuccin.groups.integrations.lsp_saga')
		require('lspsaga').setup({
			symbol_in_winbar = {
				separator = '  ',
				color_mode = false,
			},
			lightbulb = {
				enable = false
			},
			ui = {
				border = 'rounded',
				kind = catppuccin_theme.custom_kind()
			},
			outline = {
				auto_close = false
			}
		})

		local keymap = vim.keymap.set

		keymap('n', '<leader>cp', '<cmd>Lspsaga peek_definition<CR>')
		keymap('n', '<leader>cf', '<cmd>Lspsaga lsp_finder<CR>')
		keymap('n', '<leader>cr', '<cmd>Lspsaga rename<CR>')
	end,
}
