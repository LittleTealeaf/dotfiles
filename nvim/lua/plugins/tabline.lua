local function tabline_command(command)
	return function()
		require('tabline')[command]()
	end
end


return {
	{
		'kdheepak/tabline.nvim',
		dependencies = {
			'kyazdani42/nvim-web-devicons'
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
			{ '<leader>bd', ':bd<CR>',                          desc = "Delete Buffer" },
			{ '<leader>bc', ':%bd<CR>',                         desc = "Delete All Buffers" }
		}
	}
}
