local M = {}


function M.setup()
	local keyset = vim.keymap.set
	local cmd = vim.cmd
	cmd [[
		inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
		inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
		inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
	]]

	
end

return M
