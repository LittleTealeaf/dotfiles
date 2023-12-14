vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>", { silent = true, desc = "Write File" })
vim.keymap.set("n", "<leader>wa", "<cmd>wa<CR>", { silent = true, desc = "Write All" })

vim.keymap.set('n', '<A-S-[>', '<cmd>bprevious<CR>', { silent = true })
vim.keymap.set('n', '<A-S-]>', '<cmd>bnext<CR>', { silent = true })

-- Windows
vim.keymap.set('n', '<leader>wq', '<cmd>q<CR>', { silent = true, desc = "Close Window" })
vim.keymap.set('n', '<leader>wx', '<cmd>split<CR>', { silent = true, desc = "Split" })
vim.keymap.set('n', '<leader>wv', '<cmd>vsplit<CR>', { silent = true, desc = "Vertical Split" })
vim.keymap.set('n', '<leader>wo', '<C-W>o', { silent = true, desc = "Close Other Windows" })

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(_)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true, desc = "LSP Hover Definition" })

		vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format({ async = true }) end,
			{ silent = true, desc = "Format Code" })

		vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, { silent = true, desc = "Goto Definition" })
		vim.keymap.set('n', '<leader>cD', vim.lsp.buf.declaration, { silent = true, desc = "Goto Declaration" })
		vim.keymap.set('n', '<leader>ci', vim.lsp.buf.implementation, { silent = true, desc = "Goto Implementation" })
		vim.keymap.set('n', '<leader>cn', vim.lsp.buf.rename, { silent = true, desc = "Rename Symbol" })
		vim.keymap.set('n', '<leader>ce', vim.diagnostic.open_float, { silent = true, desc = "Open Line Errors" })
		vim.keymap.set({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, { silent = true, desc = "Code Actions" })

		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { silent = true, desc = "Goto Prev Diagnostic" })
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { silent = true, desc = "Goto Next Diagnostic" })
	end
})
