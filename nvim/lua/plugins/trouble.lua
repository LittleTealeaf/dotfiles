return {
	'folke/trouble.nvim',
	branch = 'dev',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	init = function()
		vim.api.nvim_create_autocmd('FileType', {
			pattern = 'qf',
			callback = function()
				vim.schedule(function()
					vim.cmd('close')
					vim.cmd('Trouble quickfix')
				end)
			end
		})
	end,
	config = function()
		local trouble = require('trouble')

		trouble.setup({
			focus = true,
			win = {
				size = {
					height = 12,
					width = 50
				}
			},
			keys = {
				["<M-CR>"] = "jump_close"
			}
		})


		vim.keymap.set('n', '<leader>tr', function() trouble.open('lsp') end, { desc = "LSP" })
		vim.keymap.set('n', '<leader>tf', function() trouble.open('telescope') end, { desc = "Telescope" })
		vim.keymap.set('n', '<leader>te', function() trouble.open('diagnostics') end, { desc = "Diagnostics" })
		vim.keymap.set('n', '<leader>ts', function() trouble.open('lsp_document_symbols') end, { desc = "Symbols" })
		vim.keymap.set('n', '<leader>tq', function() trouble.open('quickfix') end, { desc = "QuickFix" })

		vim.keymap.set('n', '<leader>th', trouble.close, { desc = "Close" })
	end
}
