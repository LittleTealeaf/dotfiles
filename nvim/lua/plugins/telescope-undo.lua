return {
	'debugloop/telescope-undo.nvim',
	dependencies = { 'nvim-telescope/telescope.nvim' },
	config = function()
		local telescope = require('telescope')

		telescope.load_extension('undo')

		vim.keymap.set('n', '<leader>fu', function()
			telescope.extensions['undo']['undo']({
				use_delta = false,
				diff_context_lines = 2,
			})
		end, { desc = "Undo Tree" })
	end,
	keys = {
		{
			'<leader>fu',
			desc = "Undo Tree"
		}
	}

}
