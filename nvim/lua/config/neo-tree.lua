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
  },
})



setkey('n','<leader>et', ':NeoTreeShowToggle<CR>', {silent=true})
setkey('n','<leader>ef', ':Neotree filesystem <CR>', {silent=true})
setkey('n','<leader>eh', ':NeoTreeClose<CR>', {silent=true})
setkey('n','<leader>eg', ':Neotree git_status<CR>', {silent=true})
setkey('n','<leader>eb', ':Neotree buffers<CR>', {silent=true})
