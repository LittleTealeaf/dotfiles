return {
	'jvgrootveld/telescope-zoxide',
	dependencies = { 'nvim-telescope/telescope.nvim' },
	config = function()
		local telescope = require('telescope')
		local themes = require('telescope.themes')

		telescope.load_extension('zoxide')

		vim.keymap.set('n', '<leader>fz', function()
			telescope.extensions['zoxide']['list'](themes.get_dropdown({}))
		end, { desc = "Zoxide" })
	end,
	keys = {
		{ '<leader>fz', desc = "Zoxide" }
	}

}
