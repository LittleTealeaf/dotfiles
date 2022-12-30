local telescope = require('telescope')
local setkey = vim.keymap.set
local actions = require('telescope.builtin')
local coc_actions = telescope.extensions.coc
local gh_actions = telescope.extensions.gh

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

setkey('n','<leader>gi', gh_actions.issues, {})
setkey('n','<leader>gp', gh_actions.pull_request, {})
setkey('n','<leader>gg', gh_actions.gist, {})
setkey('n','<leader>gr', gh_actions.run, {})
setkey('n','<leader>gc', actions.git_commits, {})
setkey('n','<leader>gs', actions.git_status, {})
setkey('n','<leader>gf', actions.git_files,{})
setkey('n','<leader>gb', actions.git_branches, {})


setkey('n','<leader>cc',coc_actions.commands, {})
setkey('n','<leader>cd',coc_actions.definitions,{})
setkey('n','<leader>ci',coc_actions.implementations, {})
setkey('n','<leader>cl',coc_actions.locations, {})
setkey('n','<leader>ct',coc_actions.type_definitions, {})
setkey('n','<leader>cs',coc_actions.document_symbols, {})
setkey('n','<leader>ce',coc_actions.diagnostics, {})
setkey('n','<leader>cE',coc_actions.workspace_diagnostics,{})

