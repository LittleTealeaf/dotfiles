local neotree = require('neo-tree')
local setkey = vim.keymap.set

neotree.setup({
  follow_current_file = true,
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false
    }
  },
  mappings = {
    ["t"] = "",
  }
})



setkey('n','<leader>tt', ':NeoTreeShowToggle<CR>', {silent=true})
setkey('n','<leader>te', ':Neotree position=left <CR>', {silent=true})
setkey('n','<leader>th', ':NeoTreeClose<CR>', {silent=true})
