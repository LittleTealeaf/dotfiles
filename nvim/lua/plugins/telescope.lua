local function in_dropdown(action)
	return function(args)
		action(require('telescope.themes').get_dropdown(args))
	end
end

local function in_ivy(action)
	return function(args)
		action(require('telescope.themes').get_ivy(args))
	end
end

local function in_cursor(action)
	return function(args)
		action(require('telescope.themes').get_cursor(args))
	end
end

local function use_builtin(name)
	return function(args)
		require('telescope.builtin')[name](args)
	end
end

local function use_extension(extension, action)
	return function(args)
		require('telescope').extensions[extension][action](args)
	end
end

local function with_args(fun, args)
	return function()
		fun(args)
	end
end

local function load_extension_config(extension)
	return function()
		require('telescope').load_extension(extension)
	end
end

local telescope_dependency = {
	'nvim-telescope/telescope.nvim',
	name = 'telescope'
}


return {
	{
		'nvim-telescope/telescope.nvim',
		name = 'telescope',
		event = 'VeryLazy',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-ui-select.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build =
				'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
			},
			'folke/noice.nvim',
			'nvim-treesitter/nvim-treesitter'
		},
		config = function()
			local telescope = require('telescope')
			local actions = require('telescope.actions')

			telescope.setup({
				extensions = {
					['ui-select'] = {
						require('telescope.themes').get_dropdown({}),
					},
				},
				file_browser = {
					theme = 'dropdown'
				},
				defaults = {
					mappings = {
						i = {
							["<Tab>"] = actions.move_selection_next,
							["<S-Tab>"] = actions.move_selection_previous,
							["<C-Down>"] = actions.toggle_selection + actions.move_selection_worse,
							["<C-Up>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.close,
						},
					}
				}
			})

			telescope.load_extension('fzf')
			telescope.load_extension('noice')
			telescope.load_extension('ui-select')
		end,
		keys = {
			{
				'<leader>ff',
				in_dropdown(use_builtin('find_files')),
				desc = 'Find files'
			},
			{
				'<leader>fg',
				in_dropdown(use_builtin('live_grep')),
				desc = 'Live grep'
			},
			{
				'<leader>fb',
				in_dropdown(use_builtin('buffers')),
				desc = 'List Buffers'
			},
			{
				'<leader>fo',
				in_dropdown(use_builtin('oldfiles')),
				desc = 'List Old Files'
			},
			{
				'<leader>sf',
				in_dropdown(use_builtin('lsp_document_symbols')),
				desc = 'List Document Symbols'
			},
			{
				'<leader>sa',
				in_dropdown(use_builtin('lsp_workspace_symbols')),
				desc = 'List Workspace Symbols'
			},
			{
				'<leader>ca',
				vim.lsp.buf.code_action,
				desc = 'List Code Actions'
			},
			{
				'<leader>nn',
				in_dropdown(use_extension('notify', 'notify')),
				desc = 'Show Notifications'
			},
			{
				'<leader>fl',
				in_dropdown(use_builtin('current_buffer_fuzzy_find')),
				desc = 'Fuzzy Find in Current Buffer'
			},
			{
				'<leader>cd',
				with_args(in_cursor(use_builtin('lsp_definitions')), { layout_config = { width = 0.5 } }),
				desc = 'List LSP Definitions'
			},
			{
				'<leader>ci',
				in_cursor(use_builtin('lsp_implementations')),
				desc = "List LSP Implementations"
			},
			{
				'<leader>st',
				in_dropdown(use_builtin('treesitter')),
				desc = 'List Treesitter Elements'
			},
			{
				'<leader>cdd',
				in_dropdown(use_builtin('diagnostics')),
				desc = "Show LSP Diagnostics"
			}
		}
	},
	{
		'nvim-telescope/telescope-file-browser.nvim',
		event = 'VeryLazy',
		dependencies = { telescope_dependency },
		config = load_extension_config('file_browser'),
		keys = {
			{
				'<leader>fe',
				with_args(in_ivy(use_extension('file_browser', 'file_browser')), { hidden = true }),
				desc = 'File Browser'
			}
		}
	},
	{
		'nvim-telescope/telescope-github.nvim',
		event = 'VeryLazy',
		dependencies = { telescope_dependency },
		config = load_extension_config('gh'),
		keys = {
			{ '<leader>gi', use_extension('gh', 'issues'),        desc = 'GitHub Issues' },
			{ '<leader>gp', use_extension('gh', 'pull_request'), desc = 'GitHub Pull Requests' }
		}
	},
}
