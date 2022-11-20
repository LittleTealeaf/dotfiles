local set_key = vim.keymap.set

local telescope = require("telescope")


set_key('n','<leader>ba', telescope.extensions.vim_bookmarks.all, {})
set_key('n','<leader>bs', telescope.extensions.vim_bookmarks.current_file, {})
