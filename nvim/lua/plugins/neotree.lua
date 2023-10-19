return {
	'nvim-neo-tree/neo-tree.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim',
	},
	enabled = false,
	opts = {
		enable_diagnostics = true,
		default_component_configs = {
			last_modified = {
				enabled = false
			},
			type = {
				enabled = false
			},
			file_size = {
				enabled = false
			},
			created = {
				enabled = false
			}
		},
		filesystem = {
			hijack_netrw_behavior = "disabled",
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
				never_show_by_pattern = {
					".git"
				}
			},
			window = {
				position = 'float'
			},
		},
		window = {
			position = 'float',
			mappings = {
				["t"] = "",
				["h"] = "close_node",
				["l"] = "open"
			},
		},
	},
	keys = {
		{ '<leader>ef', '<cmd>Neotree filesystem<CR>' },
		{ '<leader>eh', '<cmd>Neotree close<CR>' },
		{ '<leader>eg', '<cmd>Neotree git_status<CR>' },
		{ '<leader>eb', '<cmd>Neotree buffers<CR>' },
	},
	lazy = false,
}
