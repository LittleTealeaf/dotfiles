return {
	"nvim-lualine/lualine.nvim",
	name = 'lualine',
	dependencies = {
		{ 'kyazdani42/nvim-web-devicons' },
		{
			'kdheepak/tabline.nvim',
			name = 'tabline',
			opts = {
				enable = false,
				options = {
					section_separators = { '', '' },
					component_separators = { '', '' }
				}
			},
		},
		{ 'rmagatti/auto-session' }
	},
	config = function()
		require('lualine').setup({
			extensions = { 'nvim-dap-ui', 'neo-tree', 'toggleterm', 'fzf', 'fugitive', 'aerial' },
			options = {
				theme = 'catppuccin',
				section_separators = {
					left = '',
					right = ''
				},
				component_separators = {
					left = ''
				}
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { {
					'filename',
					path = 1
				}, 'diff' },
				lualine_c = {},
				lualine_x = { 'diagnostics' },
				lualine_y = { 'filetype' },
				lualine_z = { 'location' }
			},
			tabline = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { require('tabline').tabline_buffers },
				lualine_x = { require('tabline').tabline_tabs },
				lualine_y = { 'branch' },
				lualine_z = { require('auto-session').current_session_name }
			}
		})

		local tabline = require('tabline')
		local keybind = vim.keymap.set
		keybind('n', '<A-[>', tabline.buffer_previous, {})
		keybind('n', '<A-]>', tabline.buffer_next, {})
	end
}
