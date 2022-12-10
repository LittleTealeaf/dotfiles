local tabline = require('tabline')
local lualine = require('lualine')
local autosession = require("auto-session-library")
local keybind = vim.keymap.set
local create_nvim_command = vim.api.nvim_create_user_command

tabline.setup({
	enable = false
})

keybind('n','<A-[>', tabline.buffer_previous ,{} )
keybind('n','<A-]>',tabline.buffer_next ,{})

keybind('n','<A-{>', function()
	vim.cmd('tabprev')
end, {})

keybind('n','<A-}>', function()
	vim.cmd('tabnext')
end, {})

create_nvim_command(
	'Tabn',
	function(input)
		tabline.tab_rename(input.args)
	end,
	{
		nargs=1
	}
)

create_nvim_command(
	'ShowAllBuffers',
	function()
		tabline.toggle_show_all_buffers()
	end,
	{}
)

lualine.setup({
	extensions = {
		'nvim-tree',
		'fzf',
		'fugitive',
		'toggleterm',
	},
  options = {
    theme = 'catppuccin',
  },
	sections = {
		lualine_a = {'mode'},
		lualine_b = {
			{
				'filename',
				path = 1
			},
			'diff'
		},
		lualine_c = {
			'searchcount'
		},
		lualine_x = {'diagnostics'},
		lualine_y = {'filetype'},
		lualine_z = {'location'},
	},
	tabline = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {tabline.tabline_buffers},
		lualine_x = {tabline.tabline_tabs},
		lualine_y = {'branch'},
		lualine_z = {autosession.current_session_name}
	},
})
