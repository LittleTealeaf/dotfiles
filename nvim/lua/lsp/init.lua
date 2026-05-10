local icons = require('icons')


-- AUTOCOMPLETION

vim.o.complete = "o"
vim.o.completeopt = "menu,menuone,noselect,popup"
vim.o.autocomplete = false
vim.o.pumheight = 15
vim.opt.shortmess:append("c")

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		-- Create a one-shot listener that turns autocomplete back on
		-- only AFTER you've pressed a key in Insert mode
		vim.api.nvim_create_autocmd("InsertCharPre", {
			once = true,
			callback = function()
				vim.o.autocomplete = true
			end,
		})
	end,
})

-- Turn it back off when leaving Insert mode so it's ready for the next entry
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.o.autocomplete = false
	end,
})


-- Formatting

vim.api.nvim_create_user_command('Format', function()
	vim.lsp.buf.format()
end, {})


-- Diagnostics

vim.diagnostic.config({
	update_in_insert = true,
	float = {
		border = BorderedWindows and "rounded" or "none"
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "󰌵",
		},
	}
})



-- On Attach

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup("LspConfiguration", {}),
	callback = function(args)
		local bufnr = args.buf

		vim.lsp.completion.enable(true, args.data.client_id, bufnr, {
			convert = function(item)
				-- Customize the menu or kind with icons
				return {
					kind = (icons.lsp_kind_icons[item.kind]), -- Add a function icon
					abbr = item.label,
					menu = "",
				}
			end,
		})

		local function opts(desc)
			return {
				silent = true,
				buffer = bufnr,
				desc = desc
			}
		end


		-- KEYMAPS
		vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({ border = "rounded" }) end, opts("Hover Definition"))
		vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format({ async = true }) end,
			opts("Format File"))
		vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, opts("Goto Definition"))
		vim.keymap.set('n', '<leader>cD', vim.lsp.buf.declaration, opts("Goto Declaration"))
		vim.keymap.set('n', '<leader>ci', vim.lsp.buf.implementation, opts("Goto Implementation"))
		vim.keymap.set('n', '<leader>cn', vim.lsp.buf.rename, opts("Rename Symbol"))
		vim.keymap.set('n', '<leader>ce', vim.diagnostic.open_float, opts("Open Errors"))
		vim.keymap.set({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, opts("Code Action"))
		vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, opts("Goto Prev Diagnostic"))
		vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, opts("Goto Next Diagnostic"))
		vim.keymap.set('n', '<leader>cp', '<C-w>}', opts("Open Preview"))


		require('lsp.debug')
	end
})


local function has_words_before()
	local col = vim.fn.col('.') - 1
	return col ~= 0 and vim.fn.getline('.'):sub(col, col):match('%s') == nil
end


vim.keymap.set('i', '<Tab>', function()
	if vim.fn.pumvisible() == 1 then
		return '<C-n>'                          -- Next item in popup menu
	elseif vim.snippet.active({ direction = 1 }) then
		return '<cmd>lua vim.snippet.jump(1)<CR>' -- Neovim 0.10+ native snippet jump
	elseif has_words_before() then
		return '<C-x><C-o>'                     -- Trigger built-in Omnifunc
	else
		return '<Tab>'                          -- Fallback
	end
end, { expr = true, replace_keycodes = true, desc = "Autocomplete/Snippet Next" })

vim.keymap.set('i', '<S-Tab>', function()
	if vim.fn.pumvisible() == 1 then
		return '<C-p>' -- Previous item in popup menu
	elseif vim.snippet.active({ direction = -1 }) then
		return '<cmd>lua vim.snippet.jump(-1)<CR>'
	else
		return '<S-Tab>' -- Fallback
	end
end, { expr = true, replace_keycodes = true, desc = "Autocomplete/Snippet Prev" })

vim.keymap.set('i', '<C-;>', function()
	if vim.fn.pumvisible() == 1 then
		if vim.fn.complete_info().selected == -1 then
			return '<C-n><C-y>'
		else
			return '<C-y>'
		end
	else
		return '<C-;>' -- Fallback
	end
end, { expr = true, replace_keycodes = true, desc = "Confirm Autocomplete" })

vim.keymap.set('i', '<C-e>', function()
	if vim.fn.pumvisible() == 1 then
		return '<C-e>' -- Built-in keystroke to Cancel completion
	else
		return '<C-e>' -- Fallback
	end
end, { expr = true, replace_keycodes = true, desc = "Cancel Autocomplete" })
