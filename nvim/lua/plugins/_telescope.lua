local set_key = vim.keymap.set
local builtin = require("telescope.builtin")
local telescope = require("telescope")

telescope.load_extension("file_browser")
telescope.load_extension("gh")
telescope.load_extension("telescope-tabs")
telescope.load_extension("vim_bookmarks")

set_key('n','<leader>ff', builtin.find_files, {})
set_key('n','<leader>fg', builtin.live_grep, {})
set_key('n','<leader>fb', builtin.buffers, {})
set_key('n','<leader>fn', builtin.help_tags, {})
set_key('n','<leader>fe', function()
	telescope.extensions.file_browser.file_browser({hidden = true})
end, {})
set_key('n','<leader>ft', require("telescope-tabs").list_tabs, {})

set_key('n','<leader>gi', telescope.extensions.gh.issues, {})
set_key('n','<leader>gp', telescope.extensions.gh.pull_request,{})
set_key('n','<leader>gg', telescope.extensions.gh.gist, {})
set_key('n','<leader>gr', telescope.extensions.gh.run, {})

set_key('n','<leader>ba', telescope.extensions.vim_bookmarks.all, {})
set_key('n','<leader>bs', telescope.extensions.vim_bookmarks.current_file, {})