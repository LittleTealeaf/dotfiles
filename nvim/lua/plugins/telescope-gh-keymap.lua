local set_key = vim.keymap.set
local telescope = require("telescope")

set_key('n','<leader>gi', telescope.extensions.gh.issues, {})
set_key('n','<leader>gp', telescope.extensions.gh.pull_request,{})
set_key('n','<leader>gg', telescope.extensions.gh.gist, {})
set_key('n','<leader>gr', telescope.extensions.gh.run, {})
