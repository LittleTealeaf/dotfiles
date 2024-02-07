local function using_telescope(on_select)
	return function()
		-- TODO: Use the .open instead of .open_float when already in a float
		local conf = require('telescope.config').values
		local actions = require('telescope.actions')
		local action_state = require('telescope.actions.state')

		local opts = require('telescope.themes').get_dropdown({
			path_display = { 'full' },
		})

		opts.layout_config.height = 0.6

		require('telescope.pickers').new(opts, {
			prompt_title = "Open Directory",
			finder = require('telescope.finders').new_oneshot_job({ 'fd', '-td' }),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr)
				actions.select_default:replace(function()
					local selection = action_state.get_selected_entry()
					if selection == nil then
						return
					end
					actions.close(prompt_bufnr)
					on_select(selection.value)
				end)
				return true
			end
		}):find()
	end
end


return {
	'stevearc/oil.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'nvim-telescope/telescope.nvim',
	},
	opts = {
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
	},

	lazy = false,
	keys = {
		{ '<leader>et', function() require('oil').open() end,                      desc = "Open Oil" },
		{ '<leader>ef', function() require('oil').open_float() end,                desc = "Open Oil Float" },
		{ '<leader>eg', function() require('oil').open(vim.fn.getcwd()) end,       desc = "Open Oil in cwd" },
		{ '<leader>er', function() require('oil').open_float(vim.fn.getcwd()) end, desc = "Open Oil Float in cwd" },
		{
			'<leader>ew',
			using_telescope(function(selection)
				require('oil').open_float(selection)
			end
			),
			desc = "Open Oil in Float with Directory"
		},

		{
			'<leader>eq',
			using_telescope(function(selection)
				require('oil').open(selection)
			end
			),
			desc = "Open Oil in Directory"
		}
	}
}
