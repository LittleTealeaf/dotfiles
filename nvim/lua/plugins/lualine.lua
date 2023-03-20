return {
	{
		'nvim-lualine/lualine.nvim',
		name = 'lualine',
		dependencies = {
			{ 'folke/noice.nvim', },
			{ 'kyazdani42/nvim-web-devicons' },
			{
				'kdheepak/tabline.nvim',
				name = 'tabline'
			}
		},
		opts = function()
			local tabline = require('tabline')
			local noice = require('noice')
			return {
				extensions = { 'nvim-dap-ui', 'neo-tree', 'toggleterm', 'fzf', 'fugitive', 'aerial' },
				options = {
					theme = 'catppuccin',
					section_separators = {
						left = '',
						right = ''
					},
					component_separators = {
						left = ''
					}
				},
				sections = {
					lualine_a = { 'mode' },
					lualine_b = {},
					lualine_c = {
						{ 'filetype', icon_only = true},
						{ 'filename', path = 1 },
						{ 'diff' },
					},
					lualine_x = {
						{
							noice.api.status.search.get_hl,
							cond = noice.api.status.search.has
						},
						{
							noice.api.status.command.get_hl,
							cond = noice.api.status.command.has
						},
						{ 'diagnostics' },
					},
					lualine_y = {},
					lualine_z = { 'location' },
				},
				tabline = {
					lualine_a = { '' },
					lualine_b = { '' },
					lualine_c = { tabline.tabline_buffers },
					lualine_x = { 'branch' },
					lualine_y = { '' },
					lualine_z = { '' },
				}
			}
		end
	}
}
