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
			jump_close = '<cr>',
			jump = nil,
			open_folds = 'H',
			close_folds = 'h',
			toggle_fold = 'l'
		},
		use_diagnostic_signs = true,
	},
	keys = {
		{ '<leader>te', '<cmd>Trouble workspace_diagnostics<cr>', desc = "Open Trouble Diagnostics" },
		{ '<leader>tr', '<cmd>Trouble lsp_references<cr>',        desc = "Open Trouble Lsp References" },
		{ '<leader>td', '<cmd>Trouble lsp_definitions<cr>',       desc = "Open Trouble Lsp Definitions" },
		{ '<leader>ti', '<cmd>Trouble lsp_implementations<cr>',   desc = "Open Trouble Lsp Implementations" },
		{ '<leader>ty', '<cmd>Trouble lsp_type_definitions<cr>',  desc = "Open Trouble Lsp Type Definitions" },
		{ '<leader>tq', '<cmd>Trouble quickfix<cr>',              desc = "Open Quickfix in Trouble" },
		{ '<leader>tf', '<cmd>Trouble telescope<cr>',             desc = "Open Trouble Telescope" },
		{ '<leader>tt', '<cmd>Trouble<cr>',                       desc = "Toggle Trouble" },
		{ '<leader>th', '<cmd>TroubleClose<cr>',                  desc = "Close Trouble Window" },
	}
}
