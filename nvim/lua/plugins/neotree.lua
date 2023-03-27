return {
	'nvim-neo-tree/neo-tree.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim',
	},
	init = function()
		vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
	end,
	opts = {
		enable_diagnostics = true,
		follow_current_file = true,
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false
			},
			window = {
				position = 'float'
			},
		},
		window = {
			position = 'float'
		},
		mappings = {
			["t"] = ""
		},
	},
	keys = {
		{ '<leader>ef', '<cmd>Neotree filesystem<CR>' },
		{ '<leader>eh', '<cmd>NeoTreeClose<CR>' },
		{ '<leader>eg', '<cmd>Neotree git_status<CR>' },
		{ '<leader>eb', '<cmd>Neotree buffers<CR>' },
	},
	lazy = false,
}
