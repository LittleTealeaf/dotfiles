local set_key = vim.keymap.set

set_key('n','<leader>ft', require("telescope-tabs").list_tabs, {})
