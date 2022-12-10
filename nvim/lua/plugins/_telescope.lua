local set_key = vim.keymap.set
local builtin = require("telescope.builtin")
local telescope = require("telescope")

telescope.setup({
	extensions = {
		coc = {
			prefer_locations = true
		}
	}
})

telescope.load_extension("file_browser")
telescope.load_extension("gh")
telescope.load_extension("telescope-tabs")
telescope.load_extension("vim_bookmarks")
telescope.load_extension("coc")

set_key('n','<leader>ff', builtin.find_files, {})
set_key('n','<leader>fg', builtin.live_grep, {})
set_key('n','<leader>fw', builtin.grep_string, {})
set_key('n','<leader>fb', builtin.buffers, {})
set_key('n','<leader>fn', builtin.help_tags, {})
set_key('n','<leader>fo', builtin.oldfiles, {})

set_key('n','<leader>fe', function()
	telescope.extensions.file_browser.file_browser({hidden = true})
end, {})
-- set_key('n','<leader>ft', require("telescope-tabs").list_tabs, {})

set_key('n','<leader>gi', telescope.extensions.gh.issues, {})
set_key('n','<leader>gp', telescope.extensions.gh.pull_request,{})
set_key('n','<leader>gg', telescope.extensions.gh.gist, {})
set_key('n','<leader>gr', telescope.extensions.gh.run, {})
set_key('n','<leader>gc', builtin.git_commits, {})
set_key('n','<leader>gs', builtin.git_status, {})
set_key('n','<leader>gf', builtin.git_files, {})
set_key('n','<leader>gb', builtin.git_branches, {})

set_key('n','<leader>ba', telescope.extensions.vim_bookmarks.all, {})
set_key('n','<leader>bs', telescope.extensions.vim_bookmarks.current_file, {})

set_key('n','<leader>cc', ':Telescope coc commands<CR>', {silent=true})
set_key('n','<leader>cd', ":Telescope coc definitions<CR>", {silent=true})
set_key('n','<leader>ci', ':Telescope coc implementations<CR>', {silent=true})
set_key('n','<leader>cl', ':Telescope coc locations<CR>', {silent=true})
set_key('n','<leader>ct', ':Telescope coc type_definitions<CR>', {silent = true})
set_key('n','<leader>cs', ':Telescope coc document_symbols<CR>', {silent = true})
set_key('n','<leader>ce', ':Telescope coc diagnostics<CR>', {silent = true})
set_key('n','<leader>cE', ':Telescope coc workspace_diagnostics<CR>', {silent = true})
set_key('n','<leader>cS', builtin.tags, {silent = true})
