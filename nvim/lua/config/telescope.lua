local telescope = require('telescope')
local fb_actions = telescope.extensions.file_browser.actions
local setkey = vim.keymap.set
local actions = require('telescope.builtin')

telescope.setup({
	extensiosn = {
		coc = {
			theme = 'ivy'
		}
	}
})

telescope.load_extension("file_browser")
telescope.load_extension("gh")
telescope.load_extension('coc')


setkey('n','<leader>ff', actions.find_files, {})
setkey('n','<leader>fg', actions.live_grep, {})
setkey('n','<leader>fw', actions.grep_string, {})
setkey('n','<leader>fb', actions.buffers, {})
setkey('n','<leader>fo', actions.oldfiles, {})

setkey('n','<leader>fe', function()
	telescope.extensions.file_browser.file_browser({hidden=true})
end, {})

setkey('n','<leader>gi', telescope.extensions.gh.issues, {})
setkey('n','<leader>gp', telescope.extensions.gh.pull_request, {})
setkey('n','<leader>gg', telescope.extensions.gh.gist, {})
setkey('n','<leader>gr', telescope.extensions.gh.run, {})
setkey('n','<leader>gc', actions.git_commits, {})
setkey('n','<leader>gs', actions.git_status, {})
setkey('n','<leader>gf', actions.git_files,{})
setkey('n','<leader>gb', actions.git_branches, {})


setkey('n','<leader>cc',telescope.extensions.coc.commands, {})
setkey('n','<leader>cd',telescope.extensions.coc.definitions,{})
setkey('n','<leader>ci',telescope.extensions.coc.implementations, {})
setkey('n','<leader>cl',telescope.extensions.coc.locations, {})
setkey('n','<leader>ct',telescope.extensions.coc.type_definitions, {})
setkey('n','<leader>cs',telescope.extensions.coc.document_symbols, {})
setkey('n','<leader>ce',telescope.extensions.coc.diagnostics, {})
setkey('n','<leader>cE',telescope.extensions.coc.workspace_diagnostics,{})

