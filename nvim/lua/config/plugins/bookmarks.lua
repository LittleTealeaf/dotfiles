vim.cmd([[
	let g:bookmark_no_default_key_mappings = 1
]])

local set_key = vim.keymap.set

set_key('n','<leader>bb', '<Plug>BookmarkToggle', {silent = true})
set_key('n','<leader>bt', '<Plug>BookmarkAnnotate', {silent = true})
set_key('n','<leader>ba', '<Plug>BookmarkShowAll', {silent = true})
set_key('n','<leader>bj', '<Plug>BookmarkNext', {silent = true})
set_key('n','<leader>bk', '<Plug>BookmarkPrev', {silent = true})
set_key('n','<leader>bc', '<Plug>BookmarkClear', {silent = true})
set_key('n','<leader>bC', '<Plug>BookmarkClearAll', {silent = true})


set_key('n','<leader>ba', require("telescope").extensions.vim_bookmarks.all, {})
set_key('n','<leader>bs', require("telescope").extensions.vim_bookmarks.current_file, {})
