-- 1. Helper function for Tab completion
local function has_words_before()
	local col = vim.fn.col('.') - 1
	return col ~= 0 and vim.fn.getline('.'):sub(col, col):match('%s') == nil
end

-- 2. Native Neovim Completion Options (0.11+)
vim.o.complete = ".,o"
vim.o.completeopt = "fuzzy,menuone,noselect"
vim.o.autocomplete = true
vim.o.pumheight = 15


-- 4. Connect LSP Completion on Attach
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("NativeLspCompletion", {}),
	callback = function(ev)
		-- Enable native LSP autocomplete
		vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, { autotrigger = true })

		-- Essential LSP keymaps
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
	end
})

-- 5. Completion and Snippet Keymaps
vim.keymap.set('i', '<Tab>', function()
	if vim.fn.pumvisible() == 1 then
		return '<C-n>'                                -- Next item in popup menu
	elseif vim.snippet.active({ direction = 1 }) then
		return '<cmd>lua vim.snippet.jump(1)<CR>'     -- Neovim 0.10+ native snippet jump
	elseif has_words_before() then
		return '<C-x><C-o>'                           -- Trigger built-in Omnifunc
	else
		return '<Tab>'                                -- Fallback
	end
end, { expr = true, replace_keycodes = true, desc = "Autocomplete/Snippet Next" })

vim.keymap.set('i', '<S-Tab>', function()
	if vim.fn.pumvisible() == 1 then
		return '<C-p>'     -- Previous item in popup menu
	elseif vim.snippet.active({ direction = -1 }) then
		return '<cmd>lua vim.snippet.jump(-1)<CR>'
	else
		return '<S-Tab>'     -- Fallback
	end
end, { expr = true, replace_keycodes = true, desc = "Autocomplete/Snippet Prev" })

vim.keymap.set('i', '<CR>', function()
	if vim.fn.pumvisible() == 1 then
		return '<C-y>'     -- Built-in keystroke to Accept selection
	else
		return '<CR>'      -- Fallback
	end
end, { expr = true, replace_keycodes = true, desc = "Confirm Autocomplete" })

vim.keymap.set('i', '<C-e>', function()
	if vim.fn.pumvisible() == 1 then
		return '<C-e>'     -- Built-in keystroke to Cancel completion
	else
		return '<C-e>'     -- Fallback
	end
end, { expr = true, replace_keycodes = true, desc = "Cancel Autocomplete" })
