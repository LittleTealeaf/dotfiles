
if vim.g.vscode == nil then
	require("config")
	require("plugins")

	vim.cmd([[
		augroup RestoreCursorShapeOnExit
			autocmd!
			autocmd VimLeave * set guicursor=a:ver10
		augroup END
	]])
else
	require("vscode.config")
end
