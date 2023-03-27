local function tabline_command(command)
	return function()
		require('tabline')[command]()
	end
end


return {
	{
		'kdheepak/tabline.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		name = 'tabline',
		opts = {
			enable = false,
			options = {
				section_separators = { '', '' },
				component_separators = { '', '' },
				show_filename_only = true,
			}
		},
		keys = {
			{ '<A-[>',      tabline_command('buffer_previous'), desc = "Goto Prev Buffer" },
			{ '<A-]>',      tabline_command('buffer_next'),     desc = 'Goto Next Buffer' },
			{ '<leader>bd', '<cmd>bd<CR>',                          desc = "Delete Buffer" },
			{ '<leader>bc', '<cmd>%bd<CR>',                         desc = "Delete All Buffers" }
		}
	}
}
