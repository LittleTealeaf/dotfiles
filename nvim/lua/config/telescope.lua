local telescope = require('telescope')
local fb_actions = telescope.extensions.file_browser.actions
local setkey = vim.keymap.set
local actions = require('telescope.builtin')

telescope.setup({

})

telescope.load_extension("file_browser")


setkey('n','<leader>ff', actions.find_files, {})
setkey('n','<leader>fg', actions.live_grep, {})
setkey('n','<leader>fw', actions.grep_string, {})
setkey('n','<leader>fb', actions.buffers, {})
setkey('n','<leader>fo', actions.oldfiles, {})
