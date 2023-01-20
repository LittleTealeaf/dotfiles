local tabline = require('tabline')
local lualine = require('lualine')
local keybind = vim.keymap.set
local autosession = require('auto-session-library')
local noice = require('noice')

tabline.setup({
  enable = false,
	options = {
		section_separators = {
			'',''
		},
		component_separators = {
			'', ''
		}
	}
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
		section_separators = {
			left = '',
			right = ''
		},
		component_separators = {
			left = '',
			right = ''
		}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {'filename', path = 1},
      'diff'
    },
    lualine_c = {
			{
				noice.api.status.search.get_hl,
				cond = noice.api.status.search.has
			},
			{
				noice.api.status.command.get_hl,
				cond = noice.api.status.command.has
			}
		},
    lualine_x = {
			'diagnostics',
		},
    lualine_y = {'filetype'},
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
