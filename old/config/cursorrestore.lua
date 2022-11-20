-- Sets the cursor to a vertical bar on nvim exit

vim.cmd([[
  augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver10
  augroup END
]])
