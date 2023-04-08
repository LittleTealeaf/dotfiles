return {
	'folke/trouble.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
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
			toggle_fold = 'l',
		},
		use_diagnostic_signs = true,
	},
	keys = {
		{ '<leader>ce', '<cmd>Trouble workspace_diagnostics<CR>', desc = "Toggle Trouble" },
		{ '<leader>cr', '<cmd>Trouble lsp_references<CR>',        desc = "LSP references" },
		{ '<leader>cd', '<cmd>Trouble lsp_definitions<CR>',       desc = 'LSP Definitions' },
		{ '<leader>ci', '<cmd>Trouble lsp_implementations<CR>',   desc = "LSP Implementations" },
		-- { '<leader>ct', '<cmd>Trouble lsp_type_definitions<CR>',  desc = "LSP Type Definitions" },
	}
}
