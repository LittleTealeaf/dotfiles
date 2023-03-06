return {
	"nvim-lualine/lualine.nvim",
	dependencies = { 'kyazdani42/nvim-web-devicons', 'kdheepak/tabline.nvim' },
	config = function()
		local tabline = require('tabline')
		local lualine = require('lualine')
		local keybind = vim.keymap.set

		keybind('n', '<A-[>', tabline.buffer_previous, {})
		keybind('n', '<A-]>', tabline.buffer_next, {})

		tabline.setup({
			enable = false,
			options = {
				section_separators = { '', '' },
				component_separators = { '', '' }
			}
		})

		lualine.setup({
			extensions = {},
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
				-- lualine_c = { {
				-- 	"aerial",
				-- 	dense = true,
				-- 	dense_sep = '  '
				-- } },
				lualine_x = { 'diagnostics' },
				lualine_y = { 'filetype' },
				lualine_z = { 'location' }
			},
			tabline = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { tabline.tabline_buffers },
				lualine_x = { tabline.tabline_tabs },
				lualine_y = { 'branch' }
				-- lualine_z = {autosession.current_session_name}
			}
		})
	end
}
