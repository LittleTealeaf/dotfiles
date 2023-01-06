require("config")
require("plugins")

vim.cmd([[
	augroup RestoreCursorShapeOnExit
		autocmd!
		autocmd VimLeave * set guicursor=a:ver10
	augroup END
]])
