return {
	'stevearc/oil.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'nvim-telescope/telescope.nvim',
	},
	config = function()
		local oil = require('oil')
		local conf = require('telescope.config').values
		local actions = require('telescope.actions')
		local action_state = require('telescope.actions.state')
		local pickers = require('telescope.pickers')
		local finders = require('telescope.finders')


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

		local opts = require('telescope.themes').get_dropdown({
			path_display = { 'full' },
		})

		local function open_telescope(on_select)
			pickers.new(opts, {
				prompt_title = "Open Directory",
				finder = finders.new_oneshot_job({ 'fd', '-td' }),
				sorter = conf.generic_sorter(),
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

		vim.keymap.set('n', '<leader>ew', function()
			local cwd = vim.fn.getcwd()
			if oil.get_current_dir() ~= nil then
				oil.open(cwd)
			else
				oil.open_float(cwd)
			end
		end, { desc = "Open Workspace" })

		vim.keymap.set('n', '<leader>eq', function()
			oil.open(vim.fn.get_cwd())
		end, { desc = "Open Workspace" })

		vim.keymap.set('n', '<leader>er', function()
			if oil.get_current_dir() ~= nil then
				oil.open()
			else
				oil.open_float()
			end
		end, { desc = "Open Parent Directory in Float" })

		vim.keymap.set('n', '<leader>et', function() oil.open() end, { desc = "Open Parent Directory" })

		vim.keymap.set('n', '<leader>fe', function()
			if oil.get_current_dir() ~= nil then
				open_telescope(oil.open)
			else
				open_telescope(oil.open_float)
			end
		end, { desc = "Open Directory in Oil" })

		vim.keymap.set('n', '<leader>eg', function()
			open_telescope(oil.open)
		end, { desc = "Find Directory" })
	end,
	lazy = false,
}
