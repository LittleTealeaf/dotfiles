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
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.cmd('highlight! Cursor blend=100')
      end
    },
    {
      event = "neo_tree_buffer_leave",
      handler = function()
        vim.cmd('highlight! Cursor guibg=#5f87af blend=0')
      end
    }
  }
})



setkey('n','<leader>et', ':NeoTreeShowToggle<CR>', {silent=true})
setkey('n','<leader>ef', ':Neotree position=left filesystem <CR>', {silent=true})
setkey('n','<leader>eh', ':NeoTreeClose<CR>', {silent=true})
setkey('n','<leader>eg', ':Neotree position=left git_status<CR>', {silent=true})
