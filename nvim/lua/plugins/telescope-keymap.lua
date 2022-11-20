local set_key = vim.keymap.set

local telescope_btin = require("telescope.builtin")


set_key('n','<leader>ff', telescope_btin.find_files, {})
set_key('n','<leader>fg', telescope_btin.live_grep, {})
set_key('n','<leader>fb', telescope_btin.buffers, {})
set_key('n','<leader>fn', telescope_btin.help_tags, {})
