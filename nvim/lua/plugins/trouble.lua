return {
	'folke/trouble.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	opts = {
		auto_open = false,
		auto_close = true,
		action_keys = {
			jump_close = { '<cr>' },
			open_folds = 'H',
			close_folds = 'h',
			toggle_fold = 'l',
		},
		use_diagnostic_signs = true,
	},
	keys = {
		{ '<leader>ce', '<cmd>Trouble workspace_diagnostics<CR>', desc = "Toggle Trouble" },
		-- { '<leader>cr', '<cmd>Trouble lsp_references<CR>',        desc = "LSP references" }
	}
}
