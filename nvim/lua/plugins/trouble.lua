return {
	'folke/trouble.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	opts = {
		auto_open = false,
		auto_close = true,
		action_keys = {
			jump = { '<tab>' },
			jump_close = { '<cr>' },
			toggle_fold = { 'h' },
			close_folds = { 'H' },
			open_folds = { 'L' },
		},
	},
	keys = {
		{ '<leader>ce', '<cmd>Trouble workspace_diagnostics<CR>', desc = "Toggle Trouble" }
	}
}
