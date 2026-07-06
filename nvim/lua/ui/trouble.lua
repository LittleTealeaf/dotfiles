vim.pack.add({ Github('folke/trouble.nvim') })


local trouble = require('trouble')

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'qf',
	group = vim.api.nvim_create_augroup('tea.quickfix_to_trouble', {}),
	callback = function()
		local winid = vim.api.nvim_get_current_win()
		local wininfo = vim.fn.getwininfo(winid)[1]
		vim.schedule(function()
			if wininfo['quickfix'] == 1 then
				vim.cmd('cclose')
				trouble.open('quickfix')
			end
			if wininfo['loclist'] == 1 then
				vim.cmd('lclose')
				trouble.open('loclist')
			end
		end)
	end
})

vim.api.nvim_create_autocmd('VimEnter', {
	group = vim.api.nvim_create_augroup('tea.trouble.setup', {}),
	callback = function()
		trouble.setup({
			focus = true,
			win = {
				size = {
					height = 12,
					width = 50
				},
				wo = {
					cursorline = true,
					winhighlight = "CursorLine:TroubleCursorLine",
				},
			},
			keys = {
				["<M-CR>"] = "jump_close"
			},
			warn_no_results = false,
		})
	end
})


vim.keymap.set("n", "<leader>tr", function() trouble.open('lsp') end, { desc = "Definition/References" })
vim.keymap.set("n", "<leader>te", function() trouble.open('diagnostics') end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>ts", function() trouble.open('lsp_document_symbols') end, { desc = "Symbols" })
vim.keymap.set("n", "<leader>tq", function() trouble.open('quickfix') end, { desc = "QuickFix" })
vim.keymap.set("n", "<leader>th", trouble.close, { desc = "Close" })
vim.keymap.set('n', '<leader>tf', function() trouble.open('snacks_files') end, { desc = "Finder" })
vim.keymap.set('n', '<leader>td', function() trouble.open('snacks') end, { desc = "Snacks" })
vim.keymap.set('n', '<leader>tl', function() trouble.open('loclist') end, { desc = "Loclist" })
