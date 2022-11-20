local set_key = vim.keymap.set

local telescope = require("telescope")
local telescope_tabs = require("telescope-tabs")
local telescope_builtin = require("telescope.builtin")
local tabline = require("tabline")


-- Telescope File Explorer
set_key('n','<leader>ff', telescope_builtin.find_files, {})
set_key('n','<leader>fg', telescope_builtin.live_grep, {})
set_key('n','<leader>fb', telescope_builtin.buffers, {})
set_key('n','<leader>fn', telescope_builtin.help_tags, {})
set_key('n','<leader>fe', function()
	telescope.extensions.file_browser.file_browser({hidden = true})
end, {})
set_key('n','<leader>ft', telescope_tabs.list_tabs, {})

-- Telescope Github
set_key('n','<leader>gi', telescope.extensions.gh.issues, {})
set_key('n','<leader>gp', telescope.extensions.gh.pull_request,{})
set_key('n', '<leader>gg', telescope.extensions.gh.gist, {})
set_key('n','<leader>gr', telescope.extensions.gh.run, {})


-- Bookmarks
set_key('n','<leader>bb', '<Plug>BookmarkToggle', {silent = true})
set_key('n','<leader>bt', '<Plug>BookmarkAnnotate', {silent = true})
set_key('n','<leader>ba', '<Plug>BookmarkShowAll', {silent = true})
set_key('n','<leader>bj', '<Plug>BookmarkNext', {silent = true})
set_key('n','<leader>bk', '<Plug>BookmarkPrev', {silent = true})
set_key('n','<leader>bc', '<Plug>BookmarkClear', {silent = true})
set_key('n','<leader>ba', telescope.extensions.vim_bookmarks.all, {})
set_key('n','<leader>bs', telescope.extensions.vim_bookmarks.current_file, {})


-- Tabline

set_key('n','<A-[>', tabline.buffer_previous, {} )
set_key('n','<A-]>', tabline.buffer_next, {})
