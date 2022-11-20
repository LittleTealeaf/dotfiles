-- vim.cmd([[
-- 	function! g:BMWorkDirFileLocation()
-- 		let filename = 'vim-bookmarks'
-- 		let location = ''
-- 		if isdirectory('.git')
-- 			let location = getcwd().'/.git'
-- 		else
-- 			let location = finddir('.git','.;')
-- 		endif
-- 		if len(location) > 0
-- 			return location .'/'.filename
-- 		else
-- 			return getcwd().'/.'filename
-- 		endif
-- 	endfunction
-- ]])

local g = vim.g


g.bookmark_no_default_key_mappings = 1
g.bookmark_auto_save = 1
-- g.bookmark_save_per_working_dir = 1
g.bookmark_show_toggle_warning = 0
