vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>", { silent = true })
vim.keymap.set("n", "<leader>wa", "<cmd>wa<CR>", { silent = true })

vim.keymap.set('n', '<A-S-[>', '<cmd>bprevious<CR>', { silent = true })
vim.keymap.set('n', '<A-S-]>', '<cmd>bnext<CR>', { silent = true })

vim.keymap.set('n', '<leader>bw', '<cmd>q<CR>', { silent = true })
vim.keymap.set('n', '<leader>bs', '<cmd>split<CR>', { silent = true })
vim.keymap.set('n', '<leader>bv', '<cmd>vsplit<CR>', { silent = true })


-- Easy buffer switching
vim.keymap.set('n', '<leader>bf', function()
	vim.ui.input({
		prompt = "Buffer: "
	}, function(input)
		vim.api.nvim_command(":b " .. input)
	end)
end, { silent = true })


vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(_)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true })

		vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format({ async = true }) end, { silent = true })

		vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, { silent = true })
		vim.keymap.set('n', '<leader>cD', vim.lsp.buf.declaration, { silent = true })
		vim.keymap.set('n', '<leader>ci', vim.lsp.buf.implementation, { silent = true })
		vim.keymap.set('n', '<leader>cn', vim.lsp.buf.rename, { silent = true })
		vim.keymap.set('n', '<leader>ce', vim.diagnostic.open_float, { silent = true })
		vim.keymap.set({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, { silent = true })

		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { silent = true })
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { silent = true })
	end
})
