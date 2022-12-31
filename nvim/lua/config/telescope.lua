local telescope = require('telescope')
local setkey = vim.keymap.set
local actions = require('telescope.builtin')
local coc_actions = telescope.extensions.coc
local gh_actions = telescope.extensions.gh
local session_lens = require('session-lens')

telescope.setup({
	extensions = {
		coc = {
			theme = 'ivy'
		},
		file_browser = {
			theme = 'ivy'
		}
	},
	pickers = {
		find_files = {
			theme = 'ivy'
		},
		live_grep = {
			theme = 'ivy'
		},
		grep_string = {
			theme = 'ivy',
		},
		buffers = {
			theme = 'ivy'
		},
		oldfiles = {
			theme = 'ivy'
		},
	}
})

session_lens.setup({
	path_display = {'shorten'},
	theme_conf = {
		border = true
	}
})

telescope.load_extension("file_browser")
telescope.load_extension("gh")
telescope.load_extension('coc')
telescope.load_extension('session-lens')


setkey('n','<leader>ff', actions.find_files, {})
setkey('n','<leader>fg', actions.live_grep, {})
setkey('n','<leader>fw', actions.grep_string, {})
setkey('n','<leader>fb', actions.buffers, {})
setkey('n','<leader>fo', actions.oldfiles, {})

setkey('n','<leader>fe', function()
	telescope.extensions.file_browser.file_browser({hidden=true})
end, {})

setkey('n','<leader>gi', gh_actions.issues, {})
setkey('n','<leader>gp', gh_actions.pull_request, {})
setkey('n','<leader>gg', gh_actions.gist, {})
setkey('n','<leader>gr', gh_actions.run, {})
setkey('n','<leader>gc', actions.git_commits, {})
setkey('n','<leader>gs', actions.git_status, {})
setkey('n','<leader>gf', actions.git_files,{})
setkey('n','<leader>gb', actions.git_branches, {})


setkey('n','<leader>cc',':Telescope coc commands<CR>', {silent=true})
setkey('n','<leader>cd',':Telescope coc definitions<CR>',{silent=true})
setkey('n','<leader>ci',':Telescope coc implementations<CR>', {silent=true})
setkey('n','<leader>cl',':Telescope coc locations<CR>', {silent=true})
setkey('n','<leader>ct',':Telescope coc type_definitions<CR>', {silent=true})
setkey('n','<leader>cs',':Telescope coc document_symbols<CR>', {silent=true})
setkey('n','<leader>ce',':Telescope coc diagnostics<CR>', {silent=true})
setkey('n','<leader>cE',':Telescope coc workspace_diagnostics<CR>',{silent=true})

setkey('n','<leader>ss', ':Telescope session-lens search_session<CR>', {silent=true})
