return {
	'DNLHC/glance.nvim',
	opts = {
		border = {
			enable = true,
		},
	},
	keys = {
		{ '<leader>cr', '<CMD>Glance references<CR>', desc = "LSP References" }
	}
}
