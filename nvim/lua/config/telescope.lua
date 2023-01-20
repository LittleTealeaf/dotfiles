local telescope = require('telescope')
local setkey = vim.keymap.set
local actions = require('telescope.builtin')
local coc_actions = telescope.extensions.coc
local gh_actions = telescope.extensions.gh
local session_lens = require('session-lens')
local themes = require('telescope.themes')

telescope.setup({
	theme = 'ivy',
	extensions = {
		env = {
			theme = 'ivy'
		},
		coc = {
			theme = 'ivy'
		},
		file_browser = {
			theme = 'ivy'
		},
		vim_bookmarks = {
			theme = 'ivy'
		},
		repo = {
			search_dirs = {
				"~/git",
				"~/tmp"
			}
		},
		packer = {
			theme = 'ivy'
		}
	},
})

session_lens.setup({
	path_display = {'shorten'},
	theme_conf = {
		border = true
	}
})

telescope.load_extension('fzf')
telescope.load_extension("file_browser")
telescope.load_extension("gh")
telescope.load_extension('coc')
telescope.load_extension('session-lens')
telescope.load_extension('vim_bookmarks')
telescope.load_extension('repo')
telescope.load_extension('ui-select')
telescope.load_extension('notify')
telescope.load_extension('noice')
telescope.load_extension('packer')

local use_ivy = function(action)
	return function(args)
		action(themes.get_ivy(args))
	end
end

setkey('n','<leader>ff', use_ivy(actions.find_files), {})
setkey('n','<leader>fg', use_ivy(actions.live_grep), {})
setkey('n','<leader>fw', use_ivy(actions.grep_string), {})
setkey('n','<leader>fb', use_ivy(actions.buffers), {})
setkey('n','<leader>fo', use_ivy(actions.oldfiles), {})

setkey('n','<leader>fe', function()
	telescope.extensions.file_browser.file_browser({hidden=true})
end, {})

setkey('n','<leader>gi', use_ivy(gh_actions.issues), {})
setkey('n','<leader>gp', use_ivy(gh_actions.pull_request), {})
setkey('n','<leader>gg', use_ivy(gh_actions.gist), {})
setkey('n','<leader>gr', use_ivy(gh_actions.run), {})
setkey('n','<leader>gc', use_ivy(actions.git_commits), {})
setkey('n','<leader>gs', use_ivy(actions.git_status), {})
setkey('n','<leader>gf', use_ivy(actions.git_files),{})
setkey('n','<leader>gb', use_ivy(actions.git_branches), {})

setkey('n','<leader>ba',use_ivy(telescope.extensions.vim_bookmarks.all),{})
setkey('n','<leader>bs',use_ivy(telescope.extensions.vim_bookmarks.current_file),{})

setkey('n','<leader>cc',':Telescope coc commands<CR>', {silent=true})
setkey('n','<leader>cd',':Telescope coc definitions<CR>',{silent=true})
setkey('n','<leader>ci',':Telescope coc implementations<CR>', {silent=true})
setkey('n','<leader>cl',':Telescope coc locations<CR>', {silent=true})
setkey('n','<leader>ct',':Telescope coc type_definitions<CR>', {silent=true})
setkey('n','<leader>cs',':Telescope coc document_symbols<CR>', {silent=true})
setkey('n','<leader>ce',':Telescope coc diagnostics<CR>', {silent=true})
setkey('n','<leader>cE',':Telescope coc workspace_diagnostics<CR>',{silent=true})
setkey('n','<leader>ca',':Telescope coc code_actions<CR>', {silent=true})

setkey('n','<leader>ss', ':Telescope session-lens search_session<CR>', {silent=true})
setkey('n','<leader>sg', use_ivy(telescope.extensions.repo.list), {})

setkey('n','<leader>nn',use_ivy(telescope.extensions.notify.notify), {})
