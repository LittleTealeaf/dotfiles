vim.pack.add({ Github('folke/trouble.nvim') })


local trouble = require('trouble')

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'qf',
	group = vim.api.nvim_create_augroup('tea.quickfix_to_trouble', {}),
	callback = function()
		vim.schedule(function()
			vim.cmd('cclose')
			trouble.open('quickfix')
		end)
	end
})


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


vim.keymap.set("n", "<leader>tr", function() trouble.open('lsp') end, { desc = "Definition/References" })
vim.keymap.set("n", "<leader>te", function() trouble.open('diagnostics') end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>ts", function() trouble.open('lsp_document_symbols') end, { desc = "Symbols" })
vim.keymap.set("n", "<leader>tq", function() trouble.open('quickfix') end, { desc = "QuickFix" })
vim.keymap.set("n", "<leader>th", trouble.close, { desc = "Close" })
vim.keymap.set('n', '<leader>tf', function() trouble.open('snacks_files') end, { desc = "Finder" })
vim.keymap.set('n', '<leader>td', function() trouble.open('snacks') end, { desc = "Snacks" })
