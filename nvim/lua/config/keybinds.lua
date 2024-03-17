vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>", { silent = true, desc = "Write File" })
vim.keymap.set("n", "<leader>wa", "<cmd>wa<CR>", { silent = true, desc = "Write All" })

-- Windows
vim.keymap.set('n', '<leader>wq', '<cmd>q<CR>', { silent = true, desc = "Close Window" })
vim.keymap.set('n', '<leader>wx', '<cmd>split<CR>', { silent = true, desc = "Split" })
vim.keymap.set('n', '<leader>wv', '<cmd>vsplit<CR>', { silent = true, desc = "Vertical Split" })
vim.keymap.set('n', '<leader>wo', '<C-W>o', { silent = true, desc = "Close Other Windows" })

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local bufnr = args.buf

		local function with_opts(desc)
			return {
				silent = true,
				buffer = bufnr,
				desc = desc
			}
		end

		vim.keymap.set('n', 'K', vim.lsp.buf.hover, with_opts("Hover Definition"))

		vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format({ async = true }) end,
			with_opts("Format File"))

		vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, with_opts("Goto Definition"))
		vim.keymap.set('n', '<leader>cD', vim.lsp.buf.declaration, with_opts("Goto Declaration"))
		vim.keymap.set('n', '<leader>ci', vim.lsp.buf.implementation, with_opts("Goto Implementation"))
		vim.keymap.set('n', '<leader>cn', vim.lsp.buf.rename, with_opts("Rename Symbol"))
		vim.keymap.set('n', '<leader>ce', vim.diagnostic.open_float, with_opts("Open Errors"))
		vim.keymap.set({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, with_opts("Code Action"))

		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, with_opts("Goto Prev Diagnostic"))
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next, with_opts("Goto Next Diagnostic"))

		vim.keymap.set('n', '<leader>cp', '<C-w>}', with_opts("Open Preview"))
	end
})
