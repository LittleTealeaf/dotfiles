local tabline = require('tabline')
local lualine = require('lualine')
local autosession = require("auto-session-library")
local keybind = vim.keymap.set
local create_nvim_command = vim.api.nvim_create_user_command

tabline.setup({
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
		lualine_b = {'branch', 'diff'},
		lualine_c = {'filename'},
		lualine_x = {'searchcount'},
		lualine_y = {'filetype'},
		lualine_z = {'location'},
	},
	tabline = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {tabline.tabline_buffers},
		lualine_x = {tabline.tabline_tabs},
		lualine_y = {},
		lualine_z = {autosession.current_session_name}
	},
})
