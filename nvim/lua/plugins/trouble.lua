return {
	'folke/trouble.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	opts = {
		auto_open = false,
		height = 15,
		auto_close = true,
		action_keys = {
			jump_close = '<CR>',
			jump = nil,
			open_folds = 'H',
			close_folds = 'h',
			toggle_fold = 'l'
		},
		use_diagnostic_signs = true,
	},
	keys = {
		{ '<leader>te', '<cmd>Trouble workspace_diagnostics<CR>', desc = "Open Trouble Diagnostics" },
		{ '<leader>tr', '<cmd>Trouble lsp_references<CR>',        desc = "Open Trouble Lsp References" },
		{ '<leader>td', '<cmd>Trouble lsp_definitions<CR>',       desc = "Open Trouble Lsp Definitions" },
		{ '<leader>ti', '<cmd>Trouble lsp_implementations<CR>',   desc = "Open Trouble Lsp Implementations" },
		{ '<leader>ty', '<cmd>Trouble lsp_type_definitions<CR>',  desc = "Open Trouble Lsp Type Definitions" },
		{ '<leader>tf', '<cmd>Trouble telescope<CR>',             desc = "Open Trouble Telescope" },
		{ '<leader>tt', '<cmd>Trouble<CR>',                       desc = "Toggle Trouble" },
		{ '<leader>th', '<cmd>TroubleClose<CR>',                  desc = "Close Trouble Window" },
	}
}
