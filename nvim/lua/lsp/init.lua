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

vim.api.nvim_create_user_command('Format', function()
	vim.lsp.buf.format()
end, {})


vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup("LspConfiguration", {}),
	callback = function(args)
		vim.pack.add({
			Github('ray-x/lsp_signature.nvim')
		})

		local lsp_signature = require('lsp_signature')

		lsp_signature.on_attach({
			hint_enable = false
		})

		vim.keymap.set({ 'i', 's' }, '<c-k>', lsp_signature.toggle_float_win,
			{ silent = true, noremap = true, desc = "Toggle Signature" })

		local function opts(desc)
			return {
				silent = true,
				buffer = args.buf,
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
	end

})
