return {
	'debugloop/telescope-undo.nvim',
	dependencies = {
		'nvim-telescope/telescope.nvim',
		'folke/which-key.nvim',
	},
	config = function()
		local telescope = require('telescope')
		local wk = require('which-key')

		telescope.load_extension('undo')

		wk.add({
			{
				"<leader>fu",
				function()
					telescope.extensions['undo']['undo']({
						use_delta = false,
						diff_context_lines = 2,
					})
				end,
				desc = "Undo Tree",
				icon = "󰕌"
			}
		})
	end,
	keys = {
		{
			'<leader>fu',
			desc = "Undo",
			icon = "󰕌"
		}
	}
}
