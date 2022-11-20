local telescope = require("telescope")
vim.keymap.set('n','<leader>ba', telescope.extensions.vim_bookmarks.all, {})
vim.keymap.set('n','<leader>bs', telescope.extensions.vim_bookmarks.current_file, {})
