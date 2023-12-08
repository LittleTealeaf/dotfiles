return {
	'stevearc/oil.nvim',
	dependencies = { 'nvimtree/nvim-web-devicons' },
	opts = {
		keymaps = {
			['<esc>'] = 'actions.close',
			['<M-q>'] = 'actions.close',
			['<C-v>'] = 'actions.select_vsplit',
			['<C-x>'] = 'actions.select_split',
			['<C-t>'] = 'actions.open_cmdline',
			['<C-y>'] = 'actions.copy_entry_path',
			['<C-l>'] = 'actions.send_to_loclist',
			['<C-r>'] = 'actions.refresh'
		}
	},
	lazy = false,
	config = true,
	keys = {
		{ '<leader>ef', function() require('oil').open() end,                      desc = "Open Oil" },
		{ '<leader>eg', function() require('oil').open_float() end,                desc = "Open Oil Float" },
		{ '<leader>er', function() require('oil').open(vim.fn.getcwd()) end,       desc = "Open Oil in cwd" },
		{ '<leader>et', function() require('oil').open_float(vim.fn.getcwd()) end, desc = "Open Oil Float in cwd" },
	}
}
