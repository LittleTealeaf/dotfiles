local telescope = require("telescope")

vim.keymap.set('n','<leader>fe', function()
  telescope.extensions.file_browser.file_browser({hidden = true})
end,{})
