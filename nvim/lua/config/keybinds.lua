-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set

vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>", { silent = true })
vim.keymap.set("n", "<leader>wa", "<cmd>wa<CR>", { silent = true })


vim.keymap.set('n', '<A-[>', '<cmd>bprevious<CR>', { silent = true })
vim.keymap.set('n', '<A-]>', '<cmd>bnext<CR>', { silent = true })




vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true })

		vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format({ async = true }) end, { silent = true })

		vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, { silent = true })
		vim.keymap.set('n', '<leader>cD', vim.lsp.buf.declaration, { silent = true })
		vim.keymap.set('n', '<leader>ci', vim.lsp.buf.implementation, { silent = true })
		vim.keymap.set('n', '<leader>ce', vim.diagnostic.open_float, { silent = true })
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { silent = true })


		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { silent = true })
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { silent = true })
	end
})
