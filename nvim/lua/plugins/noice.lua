-- TODO: Convert to everything in config function

return {
	{
		'folke/noice.nvim',
		dependencies = {
			'MunifTanjim/nui.nvim'
		},
		lazy = false,
		config = function()
			local noice = require('noice')

			noice.setup({
				cmdline = {
					view = 'cmdline',
					format = {
						cmdline = {
							icon = ">"
						},
					}
				},
				lsp = {
					override = {
						['vim.lsp.util.convert_input_to_markdown_lines'] = true,
						['vim.lsp.util.stylize_markdown'] = true,
						['cmp.entry.get_documentation'] = true,
					},
					messages = {
						enabled = true,
						view = 'mini'
					},
					hover = {
						silent = true,
					},
				},
				presets = {
					lsp_doc_border = Transparent,
					inc_rename = true
				},
				commands = {
					history = {
						view = "popup"
					},
					errors = {
						view = "popup"
					}
				},
				messages = {
					view_history = 'popup',
					view_search = false,
				},
			})

			vim.keymap.set('n', '<leader>nl', '<cmd>Noice last<CR>', { desc = "Open Last Notification" })
			vim.keymap.set('n', '<leader>nm', '<cmd>messages<CR>', { desc = "Open Messages" })
			vim.keymap.set('n', '<leader>nc', '<cmd>Noice dismiss<CR>', { desc = "Clear Messages" })
			vim.keymap.set('n', '<leader>ne', '<cmd>Noice errors<CR>', { desc = "Noice Errors" })

			vim.keymap.set('c', '<S-Enter>', function() noice.redirect(vim.fn.getcmdline()) end, { desc = "Redirect Command" })
		end,
	}
}
