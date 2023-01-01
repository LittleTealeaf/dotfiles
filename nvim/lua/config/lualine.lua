local tabline = require('tabline')
local lualine = require('lualine')
local keybind = vim.keymap.set
local autosession = require('auto-session-library')

tabline.setup({
  enable = false
})

keybind('n','<A-[>', tabline.buffer_previous, {})
keybind('n','<A-]>', tabline.buffer_next, {})
keybind('n','<A-{>', 'tabprev', {silent=true})
keybind('n','<A-}>', 'tabnext', {silent=true})


lualine.setup({
  extensions = {
    'fzf','toggleterm', 'neo-tree'
  },
  options = {
    theme = 'catppuccin',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {'filename', path = 1},
      'diff'
    },
    lualine_c = {'searchcount'},
    lualine_x = {'diagnostics'},
    lualine_y = {
			{
				'filetype',
				icon = {align = 'right'}
			},
		},
    lualine_z = {'location'}
  },
  tabline = {
		lualine_a = {},
		lualine_b = {},
    lualine_c = {tabline.tabline_buffers},
    lualine_x = {tabline.tabline_tabs},
    lualine_y = {'branch'},
		lualine_z = {autosession.current_session_name}
  }
})
