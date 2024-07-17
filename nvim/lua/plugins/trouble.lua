return {
	'folke/trouble.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'folke/which-key.nvim',
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
		local wk = require('which-key')

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


		wk.add({
			{
				"<leader>tr",
				function()
					trouble.open('lsp')
				end,
				desc = "Definition/References",
				icon = ""
			},
			{
				"<leader>tf",
				function()
					trouble.open('telescope')
				end,
				desc = "Telescope",
				icon = ""
			},
			{
				"<leader>te",
				function() trouble.open('diagnostics') end,
				desc = "Diagnostics",
				icon = ""
			},
			{
				"<leader>ts",
				function() trouble.open('lsp_document_symbols') end,
				desc = "Symbols",
				icon = ""
			},
			{
				"<leader>tq",
				function() trouble.open('quickfix') end,
				desc = "QuickFix",
				icon = ""
			},
			{
				"<leader>th",
				trouble.close,
				desc = "Close",
				icon = ""
			}
		})
	end
}
