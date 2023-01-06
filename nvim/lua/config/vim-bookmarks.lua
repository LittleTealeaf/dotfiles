vim.cmd([[
	let g:bookmark_no_default_key_mappings = 1
	let g:bookmark_auto_save = 1
	let g:bookmark_save_per_working_dir = 1
	let g:bookmark_show_warning = 0
	let g:bookmark_show_toggle_warning = 0

	function! g:BMWorkDirFileLocation()
		let location = ''
		if isdirectory('.git')
			let location = getcwd().'/.git'
		else
			let location = finddir('.git', '.;')
		endif
		if len(location) > 0
			return location.'/vim-bookmarks'
		else
			return getcwd().'/.vim-bookmarks'
		endif
	endfunction
]])

local setkey = vim.keymap.set

setkey('n','<leader>bb','<Plug>BookmarkToggle', {silent=true})
setkey('n','<leader>bt','<Plug>BookmarkAnnotate', {silent=true})
setkey('n','<leader>ba','<Plug>BookmarkShowAll', {silent=true})
setkey('n','<leader>bj','<Plug>BookmarkNext', {silent=true})
setkey('n','<leader>bk','<Plug>BookmarkPrev',{silent=true})
setkey('n','<leader>bc','<Plug>BookmarkClear',{silent=true})
setkey('n','<leader>bC','<Plug>BookmarkClearAll',{silent=true})
