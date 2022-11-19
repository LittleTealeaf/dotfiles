local set_key = vim.keymap.set
local builtin = require("telescope.builtin")

set_key('n','<leader>ff', builtin.find_files, {})
set_key('n','<leader>fg', builtin.live_grep, {})
set_key('n','<leader>fb', builtin.buffers, {})
set_key('n','<leader>fn', builtin.help_tags, {})

