local telescope = require('telescope')
local fb_actions = telescope.extensions.file_browser.actions
local setkey = vim.keymap.set
local actions = require('telescope.builtin')

telescope.setup({

})

telescope.load_extension("file_browser")
telescope.load_extension("gh")


setkey('n','<leader>ff', actions.find_files, {})
setkey('n','<leader>fg', actions.live_grep, {})
setkey('n','<leader>fw', actions.grep_string, {})
setkey('n','<leader>fb', actions.buffers, {})
setkey('n','<leader>fo', actions.oldfiles, {})

setkey('n','<leader>gi', telescope.extensions.gh.issues, {})
setkey('n','<leader>gp', telescope.extensions.gh.pull_request, {})
setkey('n','<leader>gg', telescope.extensions.gh.gist, {})
setkey('n','<leader>gr', telescope.extensions.gh.run, {})
setkey('n','<leader>gc', actions.git_commits, {})
setkey('n','<leader>gs', actions.git_status, {})
setkey('n','<leader>gf', actions.git_files,{})
setkey('n','<leader>gb', actions.git_branches, {})
