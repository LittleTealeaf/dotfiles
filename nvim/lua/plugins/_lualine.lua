local tabline = require('tabline')
local lualine = require('lualine')
local autosession = require("auto-session-library")
local keybind = vim.keymap.set
local create_nvim_command = vim.api.nvim_create_user_command

tabline.setup({
	options = {
		show_tab_always = true,
	}
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


local colors = {
  darkgray = "#16161d",
  gray = "#727169",
  innerbg = nil,
  outerbg = "#16161D",
  normal = "#7e9cd8",
  insert = "#98bb6c",
  visual = "#ffa066",
  replace = "#e46876",
  command = "#e6c384",
}

lualine.setup({
	extensions = {
		'nvim-tree',
		'fzf',
		'fugitive',
		'toggleterm'
	},
  options = {
    theme = {
      inactive = {
        a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
        b = { fg = colors.gray, bg = colors.outerbg },
        c = { fg = colors.gray, bg = colors.innerbg },
      },
      visual = {
        a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
        b = { fg = colors.gray, bg = colors.outerbg },
        c = { fg = colors.gray, bg = colors.innerbg },
      },
      replace = {
        a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
        b = { fg = colors.gray, bg = colors.outerbg },
        c = { fg = colors.gray, bg = colors.innerbg },
      },
      normal = {
        a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
        b = { fg = colors.gray, bg = colors.outerbg },
        c = { fg = colors.gray, bg = colors.innerbg },
      },
      insert = {
        a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
        b = { fg = colors.gray, bg = colors.outerbg },
        c = { fg = colors.gray, bg = colors.innerbg },
      },
      command = {
        a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
        b = { fg = colors.gray, bg = colors.outerbg },
        c = { fg = colors.gray, bg = colors.innerbg },
      },
    }
  },
	tabline = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {tabline.tabline_buffers},
		lualine_x = {tabline.tabline_tabs},
		lualine_y = {autosession.current_session_name},
		lualine_z = {}
	},
})