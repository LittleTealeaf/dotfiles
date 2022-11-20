vim.cmd([[
	let g:bookmark_no_default_key_mappings = 1
	let g:bookmark_auto_save = 1
	let g:bookmark_save_per_working_dir = 1

	function! g:BMWorkDirFileLocation()
		let filename = 'vim-bookmarks'
		let location = ''
		if isdirectory('.git')
			let location = getcwd().'/.git'
		else
			let location = finddir('.git','.;')
		endif
		if len(location) > 0
			return location .'/'.filename
		else
			return getcwd().'/.'filename
		endif
	endfunction
]])

local set_key = vim.keymap.set

set_key('n','<leader>bb', '<Plug>BookmarkToggle', {silent = true})
set_key('n','<leader>bt', '<Plug>BookmarkAnnotate', {silent = true})
set_key('n','<leader>ba', '<Plug>BookmarkShowAll', {silent = true})
set_key('n','<leader>bj', '<Plug>BookmarkNext', {silent = true})
set_key('n','<leader>bk', '<Plug>BookmarkPrev', {silent = true})
set_key('n','<leader>bc', '<Plug>BookmarkClear', {silent = true})
set_key('n','<leader>bC', '<Plug>BookmarkClearAll', {silent = true})

