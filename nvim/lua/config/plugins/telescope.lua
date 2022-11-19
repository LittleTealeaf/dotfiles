local set_key = vim.keymap.set
local builtin = require("telescope.builtin")
local telescope = require("telescope")

set_key('n','<leader>ff', builtin.find_files, {})
set_key('n','<leader>fg', builtin.live_grep, {})
set_key('n','<leader>fb', builtin.buffers, {})
set_key('n','<leader>fn', builtin.help_tags, {})
set_key('n','<leader>fe', telescope.extensions.file_browser.file_browser, {})




telescope.load_extension("file_browser")

telescope.setup({})
