return {
	{
		'nvim-lualine/lualine.nvim',
		name = 'lualine',
		dependencies = {
			{ 'folke/noice.nvim', },
			{ 'nvim-tree/nvim-web-devicons', },
		},
		opts = function()
			local noice = require('noice')
			return {
				extensions = { 'nvim-dap-ui', 'neo-tree', 'toggleterm', 'fzf', 'fugitive', 'aerial', 'trouble' },
				options = {
					theme = 'catppuccin',
					section_separators = {
						left = '',
						right = ''
					},
					component_separators = {
						left = ''
					}
				},
				sections = {
					lualine_a = {
						{ 'mode', separator = { left = '', right = '' } }
					},
					lualine_b = {
						{
							'filename',
							newfile_status = true,
							path = 1,
							symbols = {
								unnamed = '',
								modified = '+',
								readonly = '-',
								newfile = '[New]'
							}
						},
					},
					lualine_c = {
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
					lualine_y = {
						{ 'branch' }
					},
					lualine_z = {
						{
							function()
								return string.gsub(vim.fn.getcwd(), tostring(os.getenv('HOME')), '~')
							end,
							separator = { left = '', right = '' }
						}
					},
				},
			}
		end
	}
}
