return {
	'stevearc/oil.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'folke/which-key.nvim',
	},
	cond = vim.g.features.oil,
	event = 'VeryLazy',
	config = function()
		local oil = require('oil')
		local wk = require('which-key')

		local PREFER_FLOAT = false


		oil.setup({
			view_options = {
				show_hidden = true
			},
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
		})

		wk.add({
			{
				PREFER_FLOAT and "<leader>ew" or "<leader>eq",
				function()
					local cwd = vim.fn.getcwd()
					if oil.get_current_dir() ~= nil then
						oil.open(cwd)
					else
						oil.open_float(cwd)
					end
				end,
				desc = "Open Workspace in Float",
				icon = ""
			},
			{
				PREFER_FLOAT and "<leader>eq" or "<leader>ew",
				function() oil.open(vim.fn.getcwd()) end,
				desc = "Open Workspace",
				icon = ""
			},
			{
				PREFER_FLOAT and "<leader>er" or "<leader>et",
				function()
					if oil.get_current_dir() ~= nil then
						oil.open()
					else
						oil.open_float()
					end
				end,
				desc = "Open Parent Directory in Float",
				icon = ""
			},
			{
				PREFER_FLOAT and "<leader>et" or "<leader>er",
				oil.open,
				desc = "Open Parent Directory",
				icon = ""
			},
		})
	end,
	lazy = false,
}
