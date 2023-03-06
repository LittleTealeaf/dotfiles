return {
	'pappasam/nvim-repl',
	config = function()
		local g = vim.g
		local setkey = vim.keymap.set

		g.repl_filetype_commands = {
			python = 'ipython --no-autoindent'
		}

		g.repl_split = 'bottom'
		g.repl_height = 20

		setkey('n', '<leader>ro', ':ReplOpen<CR>', { silent = true })
		setkey('n', '<leader>rs', ':ReplRunCell<CR>', { silent = true })
		setkey('v', '<leader>rs', ':ReplSend<CR>', { silent = true })
		setkey('n', '<leader>rh', ':ReplClose<CR>', { silent = true })
		setkey('n', '<leader>rc', ':ReplClear<CR>', { silent = true })
	end,
	lazy = true,
	keys = { '<leader>ro' }
}
