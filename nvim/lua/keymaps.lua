local M = {}


function M.setup()
	local keyset = vim.keymap.set
	local cmd = vim.cmd
	cmd [[
		inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
	]]

	
end

return M
